package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

// SymlinksCheck verifies that every stow-managed file in config/ has a
// corresponding symlink under $HOME pointing back into this repo.
type SymlinksCheck struct{}

func (c *SymlinksCheck) Run(repoRoot string) Result {
	stowDir := readStowDir(repoRoot)
	home, _ := os.UserHomeDir()
	globalIgnore := filepath.Join(repoRoot, stowDir, "gnustow", ".stow-global-ignore")

	var ok, bad, blocked int
	var details []string

	pkgs, err := filepath.Glob(filepath.Join(repoRoot, stowDir, "*"))
	if err != nil || len(pkgs) == 0 {
		return Result{Check: "symlinks", Status: Warn, Message: "no packages found in " + stowDir}
	}

	for _, pkg := range pkgs {
		fi, err := os.Stat(pkg)
		if err != nil || !fi.IsDir() {
			continue
		}
		localIgnore := filepath.Join(pkg, ".stow-local-ignore")

		_ = filepath.Walk(pkg, func(path string, info os.FileInfo, err error) error {
			if err != nil || info.IsDir() || info.Name() == ".stow-local-ignore" {
				return nil
			}
			rel, _ := filepath.Rel(pkg, path)
			if matchesIgnore(rel, globalIgnore) || matchesIgnore(rel, localIgnore) {
				return nil
			}

			targetRel := applyDotfiles(rel)
			target := filepath.Join(home, targetRel)

			link, lerr := os.Readlink(target)
			if lerr != nil {
				if _, serr := os.Lstat(target); serr == nil {
					// Something exists at the target but isn't a symlink.
					blocked++
					details = append(details, fmt.Sprintf("blocked: ~/%s (not a symlink)", targetRel))
				} else {
					bad++
					details = append(details, fmt.Sprintf("missing: ~/%s", targetRel))
				}
				return nil
			}

			// Resolve the link and confirm it points inside this repo.
			abs := link
			if !filepath.IsAbs(link) {
				abs = filepath.Join(filepath.Dir(target), link)
			}
			if resolved, err := filepath.EvalSymlinks(abs); err == nil {
				abs = resolved
			}
			repoAbs, _ := filepath.EvalSymlinks(repoRoot)
			if !strings.HasPrefix(abs, repoAbs+string(filepath.Separator)) {
				bad++
				details = append(details, fmt.Sprintf("wrong target: ~/%s → %s", targetRel, link))
				return nil
			}

			ok++
			return nil
		})
	}

	total := ok + bad + blocked
	switch {
	case bad > 0 || blocked > 0:
		msg := fmt.Sprintf("%d/%d linked", ok, total)
		if bad > 0 {
			msg += fmt.Sprintf(", %d missing", bad)
		}
		if blocked > 0 {
			msg += fmt.Sprintf(", %d blocked", blocked)
		}
		status := Fail
		if bad == 0 {
			status = Warn
		}
		return Result{Check: "symlinks", Status: status, Message: msg, Details: details}
	default:
		return Result{Check: "symlinks", Status: Pass, Message: fmt.Sprintf("%d/%d linked correctly", ok, total)}
	}
}

// readStowDir reads the --dir value from .stowrc, falling back to "config".
func readStowDir(repoRoot string) string {
	f, err := os.Open(filepath.Join(repoRoot, ".stowrc"))
	if err != nil {
		return "config"
	}
	defer f.Close()
	sc := bufio.NewScanner(f)
	for sc.Scan() {
		line := strings.TrimSpace(sc.Text())
		if strings.HasPrefix(line, "--dir=") {
			return strings.TrimPrefix(strings.TrimPrefix(line, "--dir="), "./")
		}
	}
	return "config"
}

// applyDotfiles simulates stow's --dotfiles flag: any path component that
// begins with "dot-" is renamed to start with ".".
func applyDotfiles(rel string) string {
	parts := strings.Split(filepath.ToSlash(rel), "/")
	for i, p := range parts {
		if strings.HasPrefix(p, "dot-") {
			parts[i] = "." + p[4:]
		}
	}
	return filepath.Join(parts...)
}

// matchesIgnore reports whether rel matches any pattern in ignoreFile,
// mirroring GNU Stow's ignore logic: basename patterns match the filename;
// ^/-prefixed patterns match against "/"+rel (anchored to package root).
func matchesIgnore(rel, ignoreFile string) bool {
	f, err := os.Open(ignoreFile)
	if err != nil {
		return false
	}
	defer f.Close()
	base := filepath.Base(rel)
	relSlash := filepath.ToSlash(rel)
	sc := bufio.NewScanner(f)
	for sc.Scan() {
		pat := strings.TrimSpace(sc.Text())
		if pat == "" {
			continue
		}
		// Stow anchors ignore patterns to the whole string, so e.g. "\.git"
		// matches the directory ".git" exactly but not ".gitconfig". Anchor the
		// pattern at both ends to mirror that; without this, unanchored matching
		// would silently skip every file whose name merely contains ".git".
		if strings.HasPrefix(pat, "^/") {
			// Path pattern (already starts with ^): match the package-relative
			// path, anchoring the end too.
			re, err := regexp.Compile(pat + `$`)
			if err != nil {
				continue
			}
			if re.MatchString("/" + relSlash) {
				return true
			}
		} else {
			// Basename pattern: must match the entire filename segment.
			re, err := regexp.Compile(`\A(?:` + pat + `)\z`)
			if err != nil {
				continue
			}
			if re.MatchString(base) {
				return true
			}
		}
	}
	return false
}
