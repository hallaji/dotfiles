package main

import (
	"os"
	"path/filepath"
	"strings"
	"testing"
)

// writeProfileStub creates a temp XDG_CONFIG_HOME containing a zsh/profile.zsh
// whose detect_profile/display_hostname echo fixed values, so ProfileCheck can
// be exercised hermetically (independent of the real machine's hostname).
func writeProfileStub(t *testing.T, profile, display string) string {
	t.Helper()
	configHome := t.TempDir()
	zshDir := filepath.Join(configHome, "zsh")
	if err := os.MkdirAll(zshDir, 0o755); err != nil {
		t.Fatal(err)
	}
	script := "detect_profile() { echo '" + profile + "'; }\n" +
		"display_hostname() { echo '" + display + "'; }\n"
	if err := os.WriteFile(filepath.Join(zshDir, "profile.zsh"), []byte(script), 0o644); err != nil {
		t.Fatal(err)
	}
	return configHome
}

// TestProfileCheck exercises ProfileCheck.Run against a stub profile.zsh. The
// hostname→profile and hostname→display-name mappings themselves are owned by
// the shell and tested in tests/unit/profile.bats; this only verifies the
// doctor's comparison logic (sourcing the shell, comparing to $DOTFILES_PROFILE).
func TestProfileCheck(t *testing.T) {
	t.Setenv("XDG_CONFIG_HOME", writeProfileStub(t, "TESTPROF", "TestHost"))

	tests := []struct {
		name    string
		profile string
		want    Status
	}{
		{"matches expected", "TESTPROF", Pass},
		{"mismatch", "WRONGPROF", Fail},
		{"unset", "", Warn},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			t.Setenv("DOTFILES_PROFILE", tt.profile)
			res := (&ProfileCheck{}).Run("")
			if res.Status != tt.want {
				t.Errorf("DOTFILES_PROFILE=%q: status=%v, want %v (%s)", tt.profile, res.Status, tt.want, res.Message)
			}
		})
	}
}

// TestProfileCheckReportsDisplayName confirms the friendly hostname from
// display_hostname makes it into the passing message.
func TestProfileCheckReportsDisplayName(t *testing.T) {
	t.Setenv("XDG_CONFIG_HOME", writeProfileStub(t, "TESTPROF", "TestHost"))
	t.Setenv("DOTFILES_PROFILE", "TESTPROF")

	res := (&ProfileCheck{}).Run("")
	if res.Status != Pass {
		t.Fatalf("status=%v, want Pass (%s)", res.Status, res.Message)
	}
	if !strings.Contains(res.Message, "TestHost") {
		t.Errorf("message %q does not contain friendly hostname %q", res.Message, "TestHost")
	}
}

// TestProfileCheckMissingScript verifies a missing profile.zsh degrades to Warn
// rather than failing hard (e.g. an environment where dotfiles aren't stowed).
func TestProfileCheckMissingScript(t *testing.T) {
	t.Setenv("XDG_CONFIG_HOME", t.TempDir()) // empty: no zsh/profile.zsh
	t.Setenv("DOTFILES_PROFILE", "TESTPROF")

	if res := (&ProfileCheck{}).Run(""); res.Status != Warn {
		t.Errorf("status=%v, want Warn (%s)", res.Status, res.Message)
	}
}
