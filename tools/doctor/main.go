package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

// Status is the outcome of a health check.
type Status int

const (
	Pass Status = iota
	Warn
	Fail
)

func (s Status) String() string {
	switch s {
	case Pass:
		return "pass"
	case Warn:
		return "warn"
	default:
		return "fail"
	}
}

func (s Status) MarshalJSON() ([]byte, error) {
	return json.Marshal(s.String())
}

// Result is the outcome of a single health check.
type Result struct {
	Check   string   `json:"check"`
	Status  Status   `json:"status"`
	Message string   `json:"message"`
	Details []string `json:"details,omitempty"`
}

// Checker runs a single health check against the repo root.
type Checker interface {
	Run(repoRoot string) Result
}

const (
	reset  = "\033[0m"
	bold   = "\033[1m"
	dim    = "\033[2m"
	green  = "\033[32m"
	yellow = "\033[33m"
	red    = "\033[31m"
)

func icon(s Status) string {
	switch s {
	case Pass:
		return green + "✓" + reset
	case Warn:
		return yellow + "⚠" + reset
	default:
		return red + "✗" + reset
	}
}

func main() {
	jsonOut := flag.Bool("json", false, "output results as JSON")
	verbose := flag.Bool("verbose", false, "show per-check details")
	flag.Parse()

	repoRoot, err := findRepoRoot()
	if err != nil {
		fmt.Fprintln(os.Stderr, "error:", err)
		os.Exit(1)
	}

	checkers := []Checker{
		&SymlinksCheck{},
		&TemplatesCheck{},
		&ProfileCheck{},
		&ToolsCheck{},
		&DaemonsCheck{},
	}

	results := make([]Result, 0, len(checkers))
	for _, c := range checkers {
		results = append(results, c.Run(repoRoot))
	}

	if *jsonOut {
		enc := json.NewEncoder(os.Stdout)
		enc.SetIndent("", "  ")
		_ = enc.Encode(results)
	} else {
		printResults(results, *verbose)
	}

	for _, r := range results {
		if r.Status == Fail {
			os.Exit(1)
		}
	}
}

func printResults(results []Result, verbose bool) {
	fmt.Printf("\n%sdotfiles doctor%s\n", bold, reset)
	fmt.Println(strings.Repeat("─", 42))
	fmt.Println()

	failed := 0
	for _, r := range results {
		fmt.Printf("  %s  %-12s %s\n", icon(r.Status), r.Check, r.Message)
		showDetails := verbose || r.Status != Pass
		if showDetails {
			for _, d := range r.Details {
				fmt.Printf("     %s↳ %s%s\n", dim, d, reset)
			}
		}
		if r.Status == Fail {
			failed++
		}
	}

	fmt.Println()
	if failed == 0 {
		fmt.Printf("%s✓ all checks passed%s\n\n", green, reset)
	} else {
		fmt.Printf("%s%d check(s) failed%s\n\n", red, failed, reset)
	}
}

// findRepoRoot walks up from cwd looking for .stowrc, which is a reliable
// marker for the dotfiles repo root. DOTFILES_HOME overrides this walk.
func findRepoRoot() (string, error) {
	if home := os.Getenv("DOTFILES_HOME"); home != "" {
		if _, err := os.Stat(filepath.Join(home, ".stowrc")); err == nil {
			return home, nil
		}
	}
	dir, err := os.Getwd()
	if err != nil {
		return "", err
	}
	for {
		if _, err := os.Stat(filepath.Join(dir, ".stowrc")); err == nil {
			return dir, nil
		}
		parent := filepath.Dir(dir)
		if parent == dir {
			return "", fmt.Errorf("repo root not found; set DOTFILES_HOME or run from inside the repo")
		}
		dir = parent
	}
}
