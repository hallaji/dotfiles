package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

// envFilePath is the shared environment file, relative to the repo root. It is
// stowed to ~/.env and sourced by .zshenv at shell startup.
const envFilePath = "config/env/.env"

// envVar is one `export NAME=value` from the env file. Want is the value the
// current environment should hold; Comparable is false when that value cannot
// be predicted (command substitution, self-reference, tilde expansion).
type envVar struct {
	Name       string
	Want       string
	Comparable bool
}

// EnvCheck reports which vars exported by config/env/.env are loaded in the
// current environment and flags values that drifted since the shell last
// sourced ~/.env.
type EnvCheck struct{}

func (c *EnvCheck) Run(repoRoot string) Result {
	vars, err := loadEnvFile(filepath.Join(repoRoot, envFilePath))
	if err != nil {
		return Result{Check: "env", Status: Warn, Message: "env file unreadable: " + err.Error()}
	}
	if len(vars) == 0 {
		return Result{Check: "env", Status: Warn, Message: "no exports found"}
	}

	var ok, stale, missing int
	var details []string
	for _, v := range vars {
		got, present := os.LookupEnv(v.Name)
		switch {
		case !present:
			missing++
			details = append(details, "missing: "+v.Name)
		case v.Comparable && got != v.Want:
			stale++
			details = append(details, "stale: "+v.Name)
		default:
			ok++
		}
	}

	msg := fmt.Sprintf("%d/%d loaded", ok, len(vars))
	status := Pass
	if stale > 0 {
		msg += fmt.Sprintf(", %d stale", stale)
		status = Warn
	}
	if missing > 0 {
		msg += fmt.Sprintf(", %d missing", missing)
		status = Fail
	}
	return Result{Check: "env", Status: status, Message: msg, Details: details}
}

// loadEnvFile parses top-level `export NAME=value` lines. Indented exports sit
// inside conditionals (OS branches) the doctor cannot evaluate and are skipped.
// Double-quoted and bare values are expanded: $VAR references resolve against
// earlier exports in the same file, then the current environment.
// Single-quoted values stay literal. Values the shell computes at source time
// (command substitution, references to the variable itself as in PATH appends,
// leading ~) are presence-only.
func loadEnvFile(path string) ([]envVar, error) {
	f, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	seen := map[string]string{}
	lookup := func(k string) string {
		if v, ok := seen[k]; ok {
			return v
		}
		return os.Getenv(k)
	}

	var vars []envVar
	sc := bufio.NewScanner(f)
	for sc.Scan() {
		line := sc.Text()
		if !strings.HasPrefix(line, "export ") {
			continue
		}
		name, rest, found := strings.Cut(strings.TrimSpace(strings.TrimPrefix(line, "export ")), "=")
		if !found || !validEnvName(name) {
			continue
		}
		raw, quote := unquoteEnvValue(rest)
		v := envVar{Name: name, Comparable: true}
		switch {
		case quote == '\'':
			v.Want = raw
		case strings.Contains(raw, "`") || strings.Contains(raw, "$("):
			v.Comparable = false
		case quote == 0 && strings.HasPrefix(raw, "~"):
			v.Comparable = false
		case strings.Contains(raw, "$"+name) || strings.Contains(raw, "${"+name+"}"):
			v.Comparable = false
		case hasParamExpansion(raw):
			v.Comparable = false
		default:
			v.Want = os.Expand(raw, lookup)
		}
		if v.Comparable {
			seen[name] = v.Want
		} else if cur, ok := os.LookupEnv(name); ok {
			seen[name] = cur
		}
		vars = append(vars, v)
	}
	return vars, sc.Err()
}

// hasParamExpansion reports whether the value uses ${...} forms beyond plain
// variable references (defaults, trims, substitutions), which os.Expand cannot
// evaluate.
func hasParamExpansion(s string) bool {
	for i := 0; i+1 < len(s); i++ {
		if s[i] != '$' || s[i+1] != '{' {
			continue
		}
		j := strings.IndexByte(s[i+2:], '}')
		if j < 0 || !validEnvName(s[i+2:i+2+j]) {
			return true
		}
		i += 2 + j
	}
	return false
}

// validEnvName reports whether s is a portable shell variable name.
func validEnvName(s string) bool {
	if s == "" {
		return false
	}
	for i, r := range s {
		switch {
		case r == '_' || r >= 'A' && r <= 'Z' || r >= 'a' && r <= 'z':
		case r >= '0' && r <= '9' && i > 0:
		default:
			return false
		}
	}
	return true
}

// unquoteEnvValue strips one level of surrounding quotes and returns the quote
// character used (0 for bare values, which end at whitespace or a comment).
func unquoteEnvValue(s string) (string, byte) {
	s = strings.TrimSpace(s)
	if len(s) >= 2 && (s[0] == '"' || s[0] == '\'') {
		if i := strings.IndexByte(s[1:], s[0]); i >= 0 {
			return s[1 : 1+i], s[0]
		}
	}
	if i := strings.IndexAny(s, " \t#"); i >= 0 {
		s = s[:i]
	}
	return s, 0
}
