package main

import (
	"fmt"
	"os"
)

// ProfileCheck verifies that $PROFILE matches the expected value for this
// machine's hostname, mirroring the detect_profile() shell function.
type ProfileCheck struct{}

func (c *ProfileCheck) Run(_ string) Result {
	hostname, err := os.Hostname()
	if err != nil {
		return Result{Check: "profile", Status: Warn, Message: "could not read hostname"}
	}

	expected := detectProfile(hostname)
	actual := os.Getenv("PROFILE")

	if actual == "" {
		return Result{
			Check:   "profile",
			Status:  Warn,
			Message: fmt.Sprintf("$PROFILE not set (expected %s for %s)", expected, hostname),
		}
	}
	if actual != expected {
		return Result{
			Check:   "profile",
			Status:  Fail,
			Message: fmt.Sprintf("got %s, expected %s (hostname: %s)", actual, expected, hostname),
		}
	}
	return Result{
		Check:   "profile",
		Status:  Pass,
		Message: fmt.Sprintf("%s on %s", actual, hostname),
	}
}

// detectProfile maps a hostname to a profile name. This MUST mirror
// detect_profile in config/zsh/.config/zsh/profile.zsh; profile_test.go sources
// that shell function and fails if the two implementations drift.
func detectProfile(hostname string) string {
	switch hostname {
	case "vhallaji-41NW96":
		return "CLTRMP"
	default:
		return "PRSNL"
	}
}
