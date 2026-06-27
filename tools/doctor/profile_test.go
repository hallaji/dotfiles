package main

import (
	"os/exec"
	"path/filepath"
	"strings"
	"testing"
)

// TestProfileParityWithShell guards against drift between detectProfile (Go,
// here) and detect_profile (zsh, config/zsh/.config/zsh/profile.zsh). Both
// hardcode the same hostname→profile mapping in different languages; this
// sources the shell function and asserts it agrees with the Go version for a
// table of hostnames. If you change one mapping, change the other or this fails.
func TestProfileParityWithShell(t *testing.T) {
	profileZsh, err := filepath.Abs("../../config/zsh/.config/zsh/profile.zsh")
	if err != nil {
		t.Fatal(err)
	}

	// Test inputs, not real machines. "vhallaji-41NW96" must stay verbatim — it
	// is the actual key the mapping special-cases (→ CLTRMP), so faking it would
	// stop testing that branch. Every other hostname hits the default (→ PRSNL),
	// so those are deliberately obvious fakes to exercise it.
	// (Non-empty only: detect_profile falls back to $(hostname) on an empty arg,
	// which would test the live machine instead of the mapping.)
	hosts := []string{
		"vhallaji-41NW96", // real special-cased host → CLTRMP
		"hal-9000",        // fictional host → default branch → PRSNL
		"deep-thought",    // fictional host → default branch → PRSNL
	}

	for _, h := range hosts {
		// Pass the path and hostname as positional args so nothing is
		// shell-interpolated into the script body.
		out, err := exec.Command("zsh", "-c",
			`source "$1" && detect_profile "$2"`, "doctor-test", profileZsh, h).Output()
		if err != nil {
			t.Fatalf("sourcing detect_profile for %q: %v", h, err)
		}
		want := strings.TrimSpace(string(out))
		if got := detectProfile(h); got != want {
			t.Errorf("hostname %q: Go detectProfile=%q, zsh detect_profile=%q — implementations drifted", h, got, want)
		}
	}
}
