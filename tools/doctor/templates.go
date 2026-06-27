package main

import (
	"crypto/sha256"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

// hexRe matches CSS hex colors; used by the :hex transform in render-templates.
var hexRe = regexp.MustCompile(`#([0-9a-fA-F]{6})`)

// TemplatesCheck re-renders every *.template file in the stow packages using
// the current environment and compares its SHA-256 to the rendered file on disk.
// A mismatch means render-templates has not been re-run since the template or
// an env var changed.
type TemplatesCheck struct{}

func (c *TemplatesCheck) Run(repoRoot string) Result {
	stowDir := readStowDir(repoRoot)
	home, _ := os.UserHomeDir()
	globalIgnore := filepath.Join(repoRoot, stowDir, "gnustow", ".stow-global-ignore")

	var ok, stale, missing int
	var details []string

	pkgs, _ := filepath.Glob(filepath.Join(repoRoot, stowDir, "*"))
	for _, pkg := range pkgs {
		fi, err := os.Stat(pkg)
		if err != nil || !fi.IsDir() {
			continue
		}
		localIgnore := filepath.Join(pkg, ".stow-local-ignore")

		_ = filepath.Walk(pkg, func(path string, info os.FileInfo, err error) error {
			if err != nil || info.IsDir() || !strings.HasSuffix(path, ".template") {
				return nil
			}
			rel, _ := filepath.Rel(pkg, path)
			if matchesIgnore(rel, globalIgnore) || matchesIgnore(rel, localIgnore) {
				return nil
			}

			targetRel := applyDotfiles(rel)
			renderedRel := strings.TrimSuffix(targetRel, ".template")
			renderedPath := filepath.Join(home, renderedRel)

			raw, err := os.ReadFile(path)
			if err != nil {
				return nil
			}

			want := renderTemplate(string(raw), needsHexTransform(path))
			got, err := os.ReadFile(renderedPath)
			if err != nil {
				missing++
				details = append(details, fmt.Sprintf("not rendered: ~/%s", renderedRel))
				return nil
			}

			if sha256.Sum256([]byte(want)) != sha256.Sum256(got) {
				stale++
				details = append(details, fmt.Sprintf("stale: ~/%s", renderedRel))
			} else {
				ok++
			}
			return nil
		})
	}

	total := ok + stale + missing
	switch {
	case stale > 0 || missing > 0:
		msg := fmt.Sprintf("%d/%d up to date", ok, total)
		if stale > 0 {
			msg += fmt.Sprintf(", %d stale", stale)
		}
		if missing > 0 {
			msg += fmt.Sprintf(", %d not rendered", missing)
		}
		return Result{Check: "templates", Status: Fail, Message: msg, Details: details}
	default:
		return Result{Check: "templates", Status: Pass, Message: fmt.Sprintf("%d/%d up to date", ok, total)}
	}
}

// renderTemplate expands ${VAR} placeholders using the current environment,
// then applies the #rrggbb → 0xffrrggbb hex transform when hex is true.
func renderTemplate(src string, hex bool) string {
	out := os.Expand(src, os.Getenv)
	if hex {
		out = hexRe.ReplaceAllString(out, "0xff$1")
	}
	return out
}

// needsHexTransform returns true for the two template files that render-templates
// annotates with :hex (borders/colors.sh and sketchybar/colors.sh).
func needsHexTransform(path string) bool {
	base := filepath.Base(path)
	if base != "colors.sh.template" {
		return false
	}
	p := filepath.ToSlash(path)
	return strings.Contains(p, "/borders/") || strings.Contains(p, "/sketchybar/")
}
