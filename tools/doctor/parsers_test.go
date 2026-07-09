package main

import (
	"os"
	"path/filepath"
	"strings"
	"testing"
)

// writeTreesitterSpec creates a repo-root stub containing a plugin spec with
// the given ensure_installed languages, mirroring the real file's layout.
func writeTreesitterSpec(t *testing.T, langs []string) string {
	t.Helper()
	repo := t.TempDir()
	dir := filepath.Join(repo, "config", "neovim", ".config", "nvim", "lua", "plugins")
	if err := os.MkdirAll(dir, 0o755); err != nil {
		t.Fatal(err)
	}
	var b strings.Builder
	b.WriteString("return {\n  \"romus204/tree-sitter-manager.nvim\",\n  opts = {\n    ensure_installed = {\n")
	for _, l := range langs {
		b.WriteString("      \"" + l + "\",\n")
	}
	b.WriteString("    },\n    auto_install = true,\n  },\n}\n")
	if err := os.WriteFile(filepath.Join(dir, "treesitter.lua"), []byte(b.String()), 0o644); err != nil {
		t.Fatal(err)
	}
	return repo
}

// installParser fakes a compiled parser and its queries dir under the given
// XDG_DATA_HOME, matching tree-sitter-manager's install layout.
func installParser(t *testing.T, dataHome, lang string) {
	t.Helper()
	site := filepath.Join(dataHome, "nvim", "site")
	for _, dir := range []string{filepath.Join(site, "parser"), filepath.Join(site, "queries", lang)} {
		if err := os.MkdirAll(dir, 0o755); err != nil {
			t.Fatal(err)
		}
	}
	parser := filepath.Join(site, "parser", lang+parserExt())
	if err := os.WriteFile(parser, []byte("fake"), 0o644); err != nil {
		t.Fatal(err)
	}
}

func TestParsersCheck(t *testing.T) {
	repo := writeTreesitterSpec(t, []string{"go", "yaml"})
	data := t.TempDir()
	t.Setenv("XDG_DATA_HOME", data)

	res := (&ParsersCheck{}).Run(repo)
	if res.Status != Warn {
		t.Fatalf("nothing installed: want Warn, got %v (%s)", res.Status, res.Message)
	}
	if res.Message != "0/2 installed" {
		t.Fatalf("unexpected message: %s", res.Message)
	}

	installParser(t, data, "go")
	installParser(t, data, "yaml")
	res = (&ParsersCheck{}).Run(repo)
	if res.Status != Pass {
		t.Fatalf("all installed: want Pass, got %v (%s)", res.Status, res.Message)
	}
	if res.Message != "all 2 installed" {
		t.Fatalf("unexpected message: %s", res.Message)
	}
}

func TestParsersCheckMissingQueries(t *testing.T) {
	repo := writeTreesitterSpec(t, []string{"go"})
	data := t.TempDir()
	t.Setenv("XDG_DATA_HOME", data)

	// Parser compiled but queries dir absent must still warn.
	installParser(t, data, "go")
	if err := os.RemoveAll(filepath.Join(data, "nvim", "site", "queries", "go")); err != nil {
		t.Fatal(err)
	}

	res := (&ParsersCheck{}).Run(repo)
	if res.Status != Warn {
		t.Fatalf("want Warn, got %v (%s)", res.Status, res.Message)
	}
	found := false
	for _, d := range res.Details {
		if strings.Contains(d, "queries") && strings.Contains(d, "go") {
			found = true
		}
	}
	if !found {
		t.Fatalf("details should name the missing queries: %v", res.Details)
	}
}

func TestParsersCheckNoSpec(t *testing.T) {
	res := (&ParsersCheck{}).Run(t.TempDir())
	if res.Status != Fail {
		t.Fatalf("missing spec file: want Fail, got %v (%s)", res.Status, res.Message)
	}
}
