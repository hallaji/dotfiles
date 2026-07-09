package main

import (
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"runtime"
	"strings"
)

// treesitterSpec is the Neovim plugin spec that owns the ensure_installed
// parser list, relative to the repo root. It is the single source of truth;
// this check parses it rather than duplicating the list in Go.
const treesitterSpec = "config/neovim/.config/nvim/lua/plugins/treesitter.lua"

// quotedLangRe matches one quoted language name inside the list, e.g. `"yaml",`.
var quotedLangRe = regexp.MustCompile(`"([A-Za-z0-9_]+)"`)

// ParsersCheck verifies that every treesitter parser listed in ensure_installed
// has been compiled into Neovim's site dir and has its query directory
// installed alongside (tree-sitter-manager's install layout). Missing parsers
// warn rather than fail: they self-install on the next Neovim launch.
type ParsersCheck struct{}

// parserExt mirrors tree-sitter-manager's util.ext(): parsers compile to
// .dylib on macOS and .so elsewhere.
func parserExt() string {
	if runtime.GOOS == "darwin" {
		return ".dylib"
	}
	return ".so"
}

// nvimSiteDir returns Neovim's stdpath('data')/site directory, where
// tree-sitter-manager installs parsers and queries.
func nvimSiteDir() string {
	data := os.Getenv("XDG_DATA_HOME")
	if data == "" {
		home, _ := os.UserHomeDir()
		data = filepath.Join(home, ".local", "share")
	}
	return filepath.Join(data, "nvim", "site")
}

// parseEnsureInstalled extracts the language names from the
// ensure_installed = { ... } block of the plugin spec.
func parseEnsureInstalled(path string) ([]string, error) {
	raw, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	var langs []string
	inBlock := false
	for _, line := range strings.Split(string(raw), "\n") {
		trimmed := strings.TrimSpace(line)
		if !inBlock {
			if strings.HasPrefix(trimmed, "ensure_installed") && strings.Contains(trimmed, "{") {
				inBlock = true
			}
			continue
		}
		if strings.HasPrefix(trimmed, "}") {
			break
		}
		if m := quotedLangRe.FindStringSubmatch(trimmed); m != nil {
			langs = append(langs, m[1])
		}
	}
	if len(langs) == 0 {
		return nil, fmt.Errorf("no ensure_installed block found in %s", path)
	}
	return langs, nil
}

func (c *ParsersCheck) Run(repoRoot string) Result {
	langs, err := parseEnsureInstalled(filepath.Join(repoRoot, treesitterSpec))
	if err != nil {
		return Result{Check: "parsers", Status: Fail, Message: err.Error()}
	}

	site := nvimSiteDir()
	ext := parserExt()
	var details []string
	ok := 0
	for _, lang := range langs {
		var missing []string
		if _, err := os.Stat(filepath.Join(site, "parser", lang+ext)); err != nil {
			missing = append(missing, "parser")
		}
		if _, err := os.Stat(filepath.Join(site, "queries", lang)); err != nil {
			missing = append(missing, "queries")
		}
		if len(missing) == 0 {
			ok++
		} else {
			details = append(details, fmt.Sprintf("missing %s: %s", strings.Join(missing, "+"), lang))
		}
	}

	if len(details) == 0 {
		return Result{Check: "parsers", Status: Pass, Message: fmt.Sprintf("all %d installed", len(langs))}
	}
	details = append(details, "hint: open nvim (auto-installs) or run :TSUpdate!")
	return Result{
		Check:   "parsers",
		Status:  Warn,
		Message: fmt.Sprintf("%d/%d installed", ok, len(langs)),
		Details: details,
	}
}
