package main

import (
	"os"
	"path/filepath"
	"testing"
)

// writeIgnore creates a temp ignore file with the given patterns.
func writeIgnore(t *testing.T, patterns string) string {
	t.Helper()
	dir := t.TempDir()
	path := filepath.Join(dir, ".stow-global-ignore")
	if err := os.WriteFile(path, []byte(patterns), 0o644); err != nil {
		t.Fatal(err)
	}
	return path
}

func TestMatchesIgnore(t *testing.T) {
	// Mirrors the real .stow-global-ignore.
	ignore := writeIgnore(t, "\\.DS_Store\n\\.git\n\\.gitignore\n\\.gitmodules\n^/README.*\n^/LICENSE.*\n")

	cases := []struct {
		rel  string
		want bool
		why  string
	}{
		{".git", true, "the .git dir is ignored exactly"},
		{".DS_Store", true, "basename pattern matches"},
		{"sub/.DS_Store", true, "basename pattern matches in subdir"},
		{".gitignore", true, "ignored by its own \\.gitignore pattern"},
		{".gitmodules", true, "ignored by its own pattern"},
		// The regression: \.git must NOT swallow these via substring matching.
		{".gitconfig.template", false, "\\.git must not match .gitconfig.template"},
		{"git/.gitconfig.template", false, "same, with a package prefix"},
		{".gitconfig", false, "\\.git must not match .gitconfig"},
		{".gitmessage.template", false, "\\.git must not match .gitmessage.template"},
		// ^/ patterns are anchored to the package root.
		{"README.md", true, "^/README.* matches at package root"},
		{"sub/README.md", false, "^/README.* does not match nested README"},
	}

	for _, c := range cases {
		if got := matchesIgnore(c.rel, ignore); got != c.want {
			t.Errorf("matchesIgnore(%q) = %v, want %v — %s", c.rel, got, c.want, c.why)
		}
	}
}

func TestApplyDotfiles(t *testing.T) {
	cases := map[string]string{
		".zshrc":                 ".zshrc",               // real dotfile name, unchanged
		".config/zsh/init.zsh":   ".config/zsh/init.zsh", // unchanged
		"dot-zshrc":              ".zshrc",               // dot- prefix transformed
		"dot-config/dot-foo/bar": ".config/.foo/bar",     // each component transformed
	}
	for in, want := range cases {
		if got := applyDotfiles(in); got != filepath.FromSlash(want) {
			t.Errorf("applyDotfiles(%q) = %q, want %q", in, got, want)
		}
	}
}
