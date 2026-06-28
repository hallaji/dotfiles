package main

import (
	"errors"
	"os"
	"path/filepath"
	"strings"
	"testing"
)

func TestLoadSpec(t *testing.T) {
	dir := t.TempDir()
	p := filepath.Join(dir, "spec")
	content := "# a comment\nGITHUB_USER\nGITHUB_ACCESS_TOKEN:secret\n\n  GIT_USER_NAME  \n"
	if err := os.WriteFile(p, []byte(content), 0o644); err != nil {
		t.Fatal(err)
	}

	got, err := loadSpec(p)
	if err != nil {
		t.Fatal(err)
	}
	want := []personalVar{
		{"GITHUB_USER", false},
		{"GITHUB_ACCESS_TOKEN", true},
		{"GIT_USER_NAME", false}, // surrounding whitespace trimmed
	}
	if len(got) != len(want) {
		t.Fatalf("got %d entries, want %d: %+v", len(got), len(want), got)
	}
	for i := range want {
		if got[i] != want[i] {
			t.Errorf("entry %d = %+v, want %+v", i, got[i], want[i])
		}
	}
}

// writeSpec writes a minimal repo layout with a personal spec and returns the
// repo root.
func writeSpec(t *testing.T, spec string) string {
	t.Helper()
	repo := t.TempDir()
	dir := filepath.Join(repo, "config", "env")
	if err := os.MkdirAll(dir, 0o755); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(dir, ".env.personal.spec"), []byte(spec), 0o644); err != nil {
		t.Fatal(err)
	}
	return repo
}

func TestPersonalCheckRedactsSecretsAndVerifiesOP(t *testing.T) {
	repo := writeSpec(t, "GITHUB_USER\nGITHUB_ACCESS_TOKEN:secret\nOP_SERVICE_ACCOUNT_TOKEN:secret\n")

	personal := t.TempDir()
	t.Setenv("XDG_PERSONAL_HOME", personal)
	env := `export GITHUB_USER="vahid"
export GITHUB_ACCESS_TOKEN="ghp_supersecret"
export OP_SERVICE_ACCOUNT_TOKEN="ops_supersecret"
`
	if err := os.WriteFile(filepath.Join(personal, "env"), []byte(env), 0o600); err != nil {
		t.Fatal(err)
	}

	origOp, origGH := opUserGet, ghCheckToken
	defer func() { opUserGet, ghCheckToken = origOp, origGH }()
	opUserGet = func(string) ([]byte, error) {
		return []byte(`{"type":"SERVICE_ACCOUNT","name":"CLI"}`), nil
	}
	ghCheckToken = func(string) (int, error) { return 200, nil } // valid token

	r := (&PersonalCheck{}).Run(repo)
	if r.Status != Pass {
		t.Errorf("status = %v, want Pass; msg=%q details=%v", r.Status, r.Message, r.Details)
	}

	// Secret VALUES must never appear anywhere in the output.
	blob := r.Message + " " + strings.Join(r.Details, " ")
	for _, secret := range []string{"ghp_supersecret", "ops_supersecret"} {
		if strings.Contains(blob, secret) {
			t.Errorf("secret value leaked into output: %q", blob)
		}
	}
	// Non-secret value SHOULD appear in the report.
	if !strings.Contains(blob, "vahid") {
		t.Errorf("non-secret value missing from report: %v", r.Details)
	}
}

func TestPersonalCheckFailsOnMissingSecret(t *testing.T) {
	repo := writeSpec(t, "GITHUB_USER\nGITHUB_ACCESS_TOKEN:secret\n")

	personal := t.TempDir()
	t.Setenv("XDG_PERSONAL_HOME", personal)
	// Only the non-secret is set; the secret is missing.
	if err := os.WriteFile(filepath.Join(personal, "env"),
		[]byte(`export GITHUB_USER="vahid"`+"\n"), 0o600); err != nil {
		t.Fatal(err)
	}

	r := (&PersonalCheck{}).Run(repo)
	if r.Status != Fail {
		t.Errorf("status = %v, want Fail (missing secret); msg=%q", r.Status, r.Message)
	}
}

func TestPersonalCheckFailsOnWrongOPAccount(t *testing.T) {
	repo := writeSpec(t, "OP_SERVICE_ACCOUNT_TOKEN:secret\n")

	personal := t.TempDir()
	t.Setenv("XDG_PERSONAL_HOME", personal)
	if err := os.WriteFile(filepath.Join(personal, "env"),
		[]byte(`export OP_SERVICE_ACCOUNT_TOKEN="ops_tok"`+"\n"), 0o600); err != nil {
		t.Fatal(err)
	}

	orig := opUserGet
	defer func() { opUserGet = orig }()
	opUserGet = func(string) ([]byte, error) {
		return []byte(`{"type":"PERSON","name":"Vahid"}`), nil
	}

	r := (&PersonalCheck{}).Run(repo)
	if r.Status != Fail {
		t.Errorf("status = %v, want Fail (non-service-account token)", r.Status)
	}
}

func TestValidateGitHubToken(t *testing.T) {
	orig := ghCheckToken
	defer func() { ghCheckToken = orig }()

	cases := []struct {
		name string
		code int
		err  bool
		want Status
	}{
		{"valid", 200, false, Pass},
		{"invalid", 401, false, Fail},
		{"forbidden but authenticated", 403, false, Warn},
		{"network error", 0, true, Warn},
	}
	for _, c := range cases {
		ghCheckToken = func(string) (int, error) {
			if c.err {
				return 0, errors.New("offline")
			}
			return c.code, nil
		}
		if st, _ := validateGitHubToken("tok"); st != c.want {
			t.Errorf("%s: status = %v, want %v", c.name, st, c.want)
		}
	}
}

func TestPersonalCheckFailsOnInvalidGitHubToken(t *testing.T) {
	repo := writeSpec(t, "GITHUB_ACCESS_TOKEN:secret\n")

	personal := t.TempDir()
	t.Setenv("XDG_PERSONAL_HOME", personal)
	if err := os.WriteFile(filepath.Join(personal, "env"),
		[]byte(`export GITHUB_ACCESS_TOKEN="ghp_stale"`+"\n"), 0o600); err != nil {
		t.Fatal(err)
	}

	orig := ghCheckToken
	defer func() { ghCheckToken = orig }()
	ghCheckToken = func(string) (int, error) { return 401, nil } // expired

	r := (&PersonalCheck{}).Run(repo)
	if r.Status != Fail {
		t.Errorf("status = %v, want Fail (invalid GitHub token)", r.Status)
	}
	if strings.Contains(strings.Join(r.Details, " "), "ghp_stale") {
		t.Errorf("token value leaked: %v", r.Details)
	}
}
