package main

import (
	"fmt"
	"os"
	"os/exec"
	"runtime"
)

// macDaemonsByProfile lists launchd service labels expected to be loaded on
// macOS, keyed by $PROFILE; "common" applies to every profile. skhd, sketchybar,
// and borders are installed unconditionally by dotup-mac (not profile-gated), so
// every Mac is expected to run all three. Add a profile key here only if some
// machine genuinely runs a different set.
var macDaemonsByProfile = map[string][]string{
	"common": {
		"com.koekeishiya.skhd",
		"homebrew.mxcl.sketchybar",
		"homebrew.mxcl.borders",
	},
}

// linuxDaemonsByProfile lists process names expected to be running on Linux,
// keyed by $PROFILE. A minimal starting point for the Arch/Hyprland machine —
// extend this (or add systemd --user units) as that setup grows.
var linuxDaemonsByProfile = map[string][]string{
	"common": {
		"Hyprland",
	},
}

// launchctlLoaded reports whether launchctl lists the service as loaded.
// processRunning reports whether a process with the exact name is running.
// Both are package vars so tests can stub them without shelling out.
var (
	launchctlLoaded = func(label string) bool {
		return exec.Command("launchctl", "list", label).Run() == nil
	}
	processRunning = func(name string) bool {
		return exec.Command("pgrep", "-x", name).Run() == nil
	}
)

// DaemonsCheck verifies that expected background services are running. macOS
// queries launchd; Linux checks for the expected processes (the Hyprland
// session). Other platforms are a no-op.
type DaemonsCheck struct{}

func (c *DaemonsCheck) Run(_ string) Result {
	profile := os.Getenv("PROFILE")
	switch runtime.GOOS {
	case "darwin":
		return evalDaemons(expectedDaemons(macDaemonsByProfile, profile), launchctlLoaded, "loaded")
	case "linux":
		return evalDaemons(expectedDaemons(linuxDaemonsByProfile, profile), processRunning, "running")
	default:
		return Result{Check: "daemons", Status: Pass, Message: "unsupported OS, skipped"}
	}
}

// expectedDaemons merges the "common" entries with the profile-specific ones.
func expectedDaemons(byProfile map[string][]string, profile string) []string {
	out := append([]string{}, byProfile["common"]...)
	if profile != "" {
		out = append(out, byProfile[profile]...)
	}
	return out
}

// evalDaemons checks each expected entry with isUp and builds a Result. verb is
// the state word used in messages ("loaded" for launchd, "running" for Linux).
func evalDaemons(expected []string, isUp func(string) bool, verb string) Result {
	if len(expected) == 0 {
		return Result{Check: "daemons", Status: Pass, Message: "no expected services for this profile"}
	}

	var ok, down int
	var details []string
	for _, name := range expected {
		if isUp(name) {
			ok++
		} else {
			down++
			details = append(details, fmt.Sprintf("not %s: %s", verb, name))
		}
	}

	total := ok + down
	if down == 0 {
		return Result{Check: "daemons", Status: Pass, Message: fmt.Sprintf("%d/%d %s", ok, total, verb)}
	}
	return Result{
		Check:   "daemons",
		Status:  Fail,
		Message: fmt.Sprintf("%d/%d %s, %d down", ok, total, verb, down),
		Details: details,
	}
}
