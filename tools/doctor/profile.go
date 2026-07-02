package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

// ProfileCheck verifies that $DOTFILES_PROFILE matches what the shell's detect_profile
// would produce for this machine, and reports the friendly hostname. It sources
// the installed profile.zsh and runs its functions rather than reimplementing
// the hostname mapping in Go, so the zsh functions are the single source of
// truth (no duplicate to keep in sync).
type ProfileCheck struct{}

func (c *ProfileCheck) Run(_ string) Result {
	hostname, err := os.Hostname()
	if err != nil {
		return Result{Check: "profile", Status: Warn, Message: "could not read hostname"}
	}

	profileZsh := profileScriptPath()
	expected, err := runProfileFunc(profileZsh, "detect_profile")
	if err != nil {
		return Result{
			Check:   "profile",
			Status:  Warn,
			Message: fmt.Sprintf("could not source %s: %v", profileZsh, err),
		}
	}
	// The friendly name is informational; if it can't be produced, just omit it.
	display, _ := runProfileFunc(profileZsh, "display_hostname")

	actual := os.Getenv("DOTFILES_PROFILE")
	if actual == "" {
		return Result{
			Check:   "profile",
			Status:  Warn,
			Message: fmt.Sprintf("$DOTFILES_PROFILE not set (expected %s for %s)", expected, hostname),
		}
	}
	if actual != expected {
		return Result{
			Check:   "profile",
			Status:  Fail,
			Message: fmt.Sprintf("got %s, expected %s (hostname: %s)", actual, expected, hostname),
		}
	}

	msg := fmt.Sprintf("%s on %s", actual, hostname)
	if display != "" {
		msg = fmt.Sprintf("%s on %s (%s)", actual, hostname, display)
	}
	return Result{Check: "profile", Status: Pass, Message: msg}
}

// profileScriptPath returns the path to the installed profile.zsh, honoring
// XDG_CONFIG_HOME the same way the shell does.
func profileScriptPath() string {
	configHome := os.Getenv("XDG_CONFIG_HOME")
	if configHome == "" {
		configHome = filepath.Join(os.Getenv("HOME"), ".config")
	}
	return filepath.Join(configHome, "zsh", "profile.zsh")
}

// runProfileFunc sources profile.zsh and runs one of its functions, returning
// its trimmed stdout. Path and function name are passed as positional args so
// nothing is interpolated into the script body.
func runProfileFunc(profileZsh, fn string) (string, error) {
	out, err := exec.Command("zsh", "-c", `source "$1" && "$2"`, "doctor", profileZsh, fn).Output()
	return strings.TrimSpace(string(out)), err
}
