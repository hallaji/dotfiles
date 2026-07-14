package main

import (
	"os"
	"path/filepath"
	"strings"
	"testing"
)

// writeEnvRepo writes a minimal repo layout holding config/env/.env.
func writeEnvRepo(t *testing.T, content string) string {
	t.Helper()
	repo := t.TempDir()
	dir := filepath.Join(repo, "config", "env")
	if err := os.MkdirAll(dir, 0o755); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(dir, ".env"), []byte(content), 0o644); err != nil {
		t.Fatal(err)
	}
	return repo
}

func TestEnvCheckAllLoaded(t *testing.T) {
	repo := writeEnvRepo(t, `
# named colors
export DOTTEST_RED="#e06c75"
export DOTTEST_ERROR="$DOTTEST_RED"
export DOTTEST_EDITOR=nvim
`)
	t.Setenv("DOTTEST_RED", "#e06c75")
	t.Setenv("DOTTEST_ERROR", "#e06c75")
	t.Setenv("DOTTEST_EDITOR", "nvim")

	r := (&EnvCheck{}).Run(repo)
	if r.Status != Pass {
		t.Fatalf("status = %v, want Pass (details: %v)", r.Status, r.Details)
	}
	if r.Message != "3/3 loaded" {
		t.Fatalf("message = %q, want %q", r.Message, "3/3 loaded")
	}
}

func TestEnvCheckReportsStaleAndMissing(t *testing.T) {
	repo := writeEnvRepo(t, `
export DOTTEST_OK="yes"
export DOTTEST_STALE="new"
export DOTTEST_GONE="x"
`)
	t.Setenv("DOTTEST_OK", "yes")
	t.Setenv("DOTTEST_STALE", "old")
	os.Unsetenv("DOTTEST_GONE")

	r := (&EnvCheck{}).Run(repo)
	if r.Status != Fail {
		t.Fatalf("status = %v, want Fail", r.Status)
	}
	if r.Message != "1/3 loaded, 1 stale, 1 missing" {
		t.Fatalf("message = %q", r.Message)
	}
	got := strings.Join(r.Details, "\n")
	for _, want := range []string{"stale: DOTTEST_STALE", "missing: DOTTEST_GONE"} {
		if !strings.Contains(got, want) {
			t.Errorf("details missing %q in:\n%s", want, got)
		}
	}
}

func TestEnvCheckUnpredictableValuesArePresenceOnly(t *testing.T) {
	repo := writeEnvRepo(t, `
export DOTTEST_CMD="$(hostname)"
export DOTTEST_PATH="$HOME/bin:$DOTTEST_PATH"
export DOTTEST_TILDE=~/bin
export DOTTEST_DEFAULT="${DOTTEST_UNSET:-/tmp}"
`)
	t.Setenv("DOTTEST_CMD", "not-the-hostname")
	t.Setenv("DOTTEST_PATH", "anything")
	t.Setenv("DOTTEST_TILDE", "anything")
	t.Setenv("DOTTEST_DEFAULT", "/tmp")

	r := (&EnvCheck{}).Run(repo)
	if r.Status != Pass {
		t.Fatalf("status = %v, want Pass (details: %v)", r.Status, r.Details)
	}
	if r.Message != "4/4 loaded" {
		t.Fatalf("message = %q", r.Message)
	}
}

func TestEnvCheckSkipsConditionalExports(t *testing.T) {
	repo := writeEnvRepo(t, `
export DOTTEST_TOP="a"
if [ "$(uname)" = "Darwin" ]; then
	export DOTTEST_BRANCH="mac"
else
	export DOTTEST_BRANCH="linux"
fi
`)
	t.Setenv("DOTTEST_TOP", "a")
	os.Unsetenv("DOTTEST_BRANCH")

	r := (&EnvCheck{}).Run(repo)
	if r.Status != Pass {
		t.Fatalf("status = %v, want Pass (details: %v)", r.Status, r.Details)
	}
	if r.Message != "1/1 loaded" {
		t.Fatalf("message = %q, want %q", r.Message, "1/1 loaded")
	}
}

func TestEnvCheckSingleQuotesStayLiteral(t *testing.T) {
	repo := writeEnvRepo(t, `export DOTTEST_LIT='$HOME/x'`)
	t.Setenv("DOTTEST_LIT", "$HOME/x")

	r := (&EnvCheck{}).Run(repo)
	if r.Status != Pass {
		t.Fatalf("status = %v, want Pass (details: %v)", r.Status, r.Details)
	}

	t.Setenv("DOTTEST_LIT", os.Getenv("HOME")+"/x")
	if r := (&EnvCheck{}).Run(repo); r.Status != Warn {
		t.Fatalf("expanded value should be stale, got %v", r.Status)
	}
}

func TestEnvCheckWarnsWhenFileUnreadable(t *testing.T) {
	r := (&EnvCheck{}).Run(t.TempDir())
	if r.Status != Warn {
		t.Fatalf("status = %v, want Warn", r.Status)
	}
}
