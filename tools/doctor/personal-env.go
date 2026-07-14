package main

import (
	"bufio"
	"encoding/json"
	"errors"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

// specPath is the personal var spec, relative to the repo root. It is the single
// source of truth shared with dotup-personal.
const specPath = "config/env/.env.personal.spec"

// personalVar is one entry from the spec.
type personalVar struct {
	Name   string
	Secret bool
}

// errOpNotFound distinguishes "op CLI is absent" from "op ran and failed".
var errOpNotFound = errors.New("op not found")

// opUserGet returns `op user get --me` JSON for the given service-account token.
// Package var so tests can stub it without invoking the real 1Password CLI.
var opUserGet = func(token string) ([]byte, error) {
	if _, err := exec.LookPath("op"); err != nil {
		return nil, errOpNotFound
	}
	cmd := exec.Command("op", "user", "get", "--me", "--format", "json")
	cmd.Env = append(os.Environ(), "OP_SERVICE_ACCOUNT_TOKEN="+token)
	return cmd.Output()
}

// errGhNotFound distinguishes "gh CLI is absent" from "gh ran and failed".
var errGhNotFound = errors.New("gh not found")

// ghCheckToken authenticates the given token against the GitHub API via the gh
// CLI (`gh api user`), returning an HTTP-like status: 200 valid, 401 invalid,
// 0 on a network/other failure. gh respects GH_TOKEN over its stored login, so
// this tests exactly the supplied token. Package var so tests can stub it.
var ghCheckToken = func(token string) (int, error) {
	if _, err := exec.LookPath("gh"); err != nil {
		return 0, errGhNotFound
	}
	cmd := exec.Command("gh", "api", "user", "--silent")
	cmd.Env = append(os.Environ(), "GH_TOKEN="+token)
	out, err := cmd.CombinedOutput()
	switch {
	case err == nil:
		return 200, nil
	case strings.Contains(string(out), "401"):
		return 401, nil // bad credentials
	default:
		return 0, err // network error, rate limit, etc.
	}
}

// PersonalCheck reports which personal env vars are populated and, where
// possible, whether their credentials are currently valid (GitHub tokens via the
// API, the 1Password token via the op CLI). Secret values are NEVER printed —
// only set/missing/valid status; non-secrets show their value.
type PersonalCheck struct{}

func (c *PersonalCheck) Run(repoRoot string) Result {
	spec, err := loadSpec(filepath.Join(repoRoot, specPath))
	if err != nil {
		return Result{Check: "personal-env", Status: Warn, Message: "spec unreadable: " + err.Error()}
	}
	if len(spec) == 0 {
		return Result{Check: "personal-env", Status: Warn, Message: "spec is empty"}
	}

	values := readPersonalEnv(personalEnvPath())

	overall := Pass
	set := 0
	var details []string
	for _, v := range spec {
		val := values[v.Name]
		var st Status
		var status string
		if val == "" {
			status = "missing"
			if v.Secret {
				st = Fail
			} else {
				st = Warn
			}
		} else {
			set++
			st, status = evalPersonalVar(v, val)
		}
		overall = worse(overall, st)
		details = append(details, personalRow(v, st, status))
	}

	msg := fmt.Sprintf("%d/%d set", set, len(spec))
	switch overall {
	case Fail:
		msg += " — issues found"
	case Warn:
		msg += " — some unverified"
	default:
		msg += ", all valid"
	}
	return Result{Check: "personal-env", Status: overall, Message: msg, Details: details}
}

// evalPersonalVar evaluates a populated var: live-validates the GitHub and
// 1Password tokens, otherwise reports set (secret) or its value (non-secret).
func evalPersonalVar(v personalVar, val string) (Status, string) {
	switch v.Name {
	case "GITHUB_ACCESS_TOKEN", "GITHUB_REGISTRY_TOKEN":
		return validateGitHubToken(val)
	case "OP_SERVICE_ACCOUNT_TOKEN":
		switch st, _ := verifyOnePassword(val); st {
		case Pass:
			return Pass, "valid (1Password)"
		case Warn:
			return Warn, "unverified (op not installed)"
		default:
			return Fail, "invalid (1Password)"
		}
	default:
		if v.Secret {
			return Pass, "set"
		}
		return Pass, val
	}
}

// personalRow renders one report line: glyph, padded name, a secret marker, and
// the status/value. Secret values are never the status text.
func personalRow(v personalVar, st Status, status string) string {
	marker := "      " // width of "secret", blank for non-secrets
	if v.Secret {
		marker = dim + "secret" + reset
	}
	return fmt.Sprintf("%s  %-26s %s  %s", icon(st), v.Name, marker, status)
}

// validateGitHubToken checks a token via gh: 200 valid, 401 invalid/expired,
// anything else (gh missing, offline) unverified rather than failing.
func validateGitHubToken(token string) (Status, string) {
	code, err := ghCheckToken(token)
	switch {
	case errors.Is(err, errGhNotFound):
		return Warn, "unverified (gh not installed)"
	case err != nil:
		return Warn, "unverified (offline?)"
	case code == 200:
		return Pass, "valid"
	case code == 401:
		return Fail, "invalid or expired"
	default:
		return Warn, fmt.Sprintf("unverified (HTTP %d)", code)
	}
}

// verifyOnePassword reports whether the token resolves to the CLI service
// account. Empty token → (Warn, ""); missing op CLI → Warn (tools check covers
// it); auth/parse/wrong-account failures → Fail.
func verifyOnePassword(token string) (Status, string) {
	if token == "" {
		return Warn, ""
	}
	out, err := opUserGet(token)
	if errors.Is(err, errOpNotFound) {
		return Warn, "1Password: op not installed, skipped"
	}
	if err != nil {
		return Fail, "1Password: token did not authenticate"
	}
	var acct struct {
		Type string `json:"type"`
		Name string `json:"name"`
	}
	if err := json.Unmarshal(out, &acct); err != nil {
		return Fail, "1Password: could not parse account"
	}
	if acct.Type == "SERVICE_ACCOUNT" && acct.Name == "CLI" {
		return Pass, "1Password: service account verified"
	}
	return Fail, fmt.Sprintf("1Password: unexpected account (%s/%s)", acct.Type, acct.Name)
}

// worse returns the more severe of two statuses (Fail > Warn > Pass).
func worse(a, b Status) Status {
	if b > a {
		return b
	}
	return a
}

// loadSpec parses the personal var spec: one NAME or NAME:secret per line,
// blank lines and # comments ignored.
func loadSpec(path string) ([]personalVar, error) {
	f, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	var vars []personalVar
	sc := bufio.NewScanner(f)
	for sc.Scan() {
		line := sc.Text()
		if i := strings.IndexByte(line, '#'); i >= 0 {
			line = line[:i]
		}
		line = strings.TrimSpace(line)
		if line == "" {
			continue
		}
		name, tag, _ := strings.Cut(line, ":")
		vars = append(vars, personalVar{Name: strings.TrimSpace(name), Secret: strings.TrimSpace(tag) == "secret"})
	}
	return vars, sc.Err()
}

// personalEnvPath returns the saved personal env file, honoring
// $XDG_PERSONAL_HOME with the same default as dotup-personal.
func personalEnvPath() string {
	home := os.Getenv("XDG_PERSONAL_HOME")
	if home == "" {
		h, _ := os.UserHomeDir()
		home = filepath.Join(h, ".local", "personal")
	}
	return filepath.Join(home, "env")
}

// readPersonalEnv parses `export VAR="value"` lines from the personal env file.
// Returns an empty map if the file is absent.
func readPersonalEnv(path string) map[string]string {
	out := map[string]string{}
	f, err := os.Open(path)
	if err != nil {
		return out
	}
	defer f.Close()

	sc := bufio.NewScanner(f)
	for sc.Scan() {
		line := strings.TrimSpace(sc.Text())
		line = strings.TrimPrefix(line, "export ")
		name, rest, found := strings.Cut(line, "=")
		if !found {
			continue
		}
		out[strings.TrimSpace(name)] = strings.Trim(rest, `"`)
	}
	return out
}
