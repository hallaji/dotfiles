package main

import (
	"fmt"
	"os/exec"
	"strings"
)

// expectedTools lists binaries that must be on PATH on a provisioned machine.
var expectedTools = []string{
	"git",
	"zsh",
	"stow",
	"tmux",
	"nvim",
	"fzf",
	"jq",
	"gh",
	"op",
	"devbox",
	"asdf",
}

// ToolsCheck verifies that every expected binary is reachable on PATH.
type ToolsCheck struct{}

func (c *ToolsCheck) Run(_ string) Result {
	var missing []string
	for _, tool := range expectedTools {
		if _, err := exec.LookPath(tool); err != nil {
			missing = append(missing, tool)
		}
	}

	if len(missing) == 0 {
		return Result{
			Check:   "tools",
			Status:  Pass,
			Message: fmt.Sprintf("all %d present", len(expectedTools)),
		}
	}
	return Result{
		Check:   "tools",
		Status:  Fail,
		Message: fmt.Sprintf("missing: %s", strings.Join(missing, ", ")),
		Details: missing,
	}
}
