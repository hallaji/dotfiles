# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

GNU Stow–based dotfiles. Each subdirectory of `config/` is a package whose
internal layout mirrors `$HOME`: a file at `config/zsh/.zshrc` is symlinked to
`~/.zshrc`, `config/zsh/.config/zsh/init.zsh` to `~/.config/zsh/init.zsh`, and
so on. Dotfiles are stored under their real names (leading `.`), not the `dot-`
prefix convention.

Stow is driven by `.stowrc` (`--dir=./config --target=~ --no-folding
--dotfiles`):

- `--dir=./config` / `--target=~` — stow packages from `config/` into `$HOME`.
- `--no-folding` — create real directories and symlink individual files, rather
  than symlinking whole directories. This lets a real `~/.config/` hold links
  from several packages at once.
- `--dotfiles` — would translate a `dot-` path component into a leading `.`, but
  this repo doesn't use that convention (no `dot-*` files exist), so the flag is
  currently a no-op. It's harmless to leave on.

## Platforms

These dotfiles run on more than one machine and must stay cross-platform:

- **macOS on Apple Silicon (arm64)** — provisioned via Homebrew (`dotup-mac`).
- **Linux, primarily Arch** — provisioned via pacman/AUR (`dotup-arch`). Avoid
  assuming Arch specifically where another distro would work; reserve
  distro-specific logic for the provisioning script.

Default to portable implementations so every capability and feature works
everywhere it reasonably can. When something is genuinely OS-specific, branch
explicitly and **keep parity** — provide the equivalent on the other platform
rather than leaving a gap (e.g. launchd vs systemd, Homebrew vs pacman,
sketchybar/aerospace on macOS vs Hyprland on Linux). The doctor's `daemons`
check is the model: one code path, an OS switch selecting the right backend.

Practical rules:

- Don't hardcode macOS-only assumptions in shared code (`config/zsh/**`,
  `tools/doctor/**`). Shared shell helpers must run on both shells/OSes.
- Keep the common toolset installed by **both** `dotup-mac` and `dotup-arch` in
  sync — a tool a shared helper relies on (e.g. `fzf`) must exist on every
  machine, not just one.
- Cross-compile/Go code stays platform-neutral except where a check is
  inherently OS-specific (then switch on `runtime.GOOS`).

## Templates

Config files needing per-machine or secret values are stored as `*.template`
files holding `${VAR}` placeholders, and are stowed into `$HOME` like any other
file. `config/bin/.local/bin/render-templates` expands them against the current
environment into the real file beside them (`~/.gitconfig.template` →
`~/.gitconfig`) and runs from the zsh profile at login. Personal values come from
`$XDG_PERSONAL_HOME` (managed by `dotup personal`). Entries tagged `:hex` also
convert `#rrggbb` → `0xffrrggbb` for tools that need it (sketchybar, borders).
The doctor's `templates` check re-renders in memory and compares, flagging
anything stale or not yet rendered.

## Toolchain

Tools are pinned in `devbox.json`. Run everything through devbox so versions
match CI:

- `devbox run lint` — pre-commit hooks (shellcheck, shfmt, yamllint, prettier, …)
- `devbox run fmt` — auto-format
- `devbox run test` — bats unit tests in `tests/unit`
- `devbox run doctor` — health checks (Go CLI in `tools/doctor`)

Run a single test:

- bats: `devbox run -- bats tests/unit/<file>.bats` (add `-f "<name regex>"` to
  narrow to one test case)
- Go: `devbox run -- sh -c "cd tools/doctor && go test -run <TestName> ./..."`

## Conventions

- Shell scripts: `#!/usr/bin/env bash` or `zsh`, formatted with shfmt, clean
  under shellcheck.
- Tests assert **correct** behavior and must fail when the script is broken —
  never encode current broken behavior as expected.
- Shell tests go in `tests/unit/*.bats`, sandboxed via `HOME`/`XDG_PERSONAL_HOME`
  with stub binaries on `PATH` (no real installs or network). Go tests live
  beside the code in `tools/doctor/*_test.go` (`go test ./...`, run in CI).
- Some helpers are mirrored across languages and must be edited together: Go
  `detectProfile` (`tools/doctor/profile.go`) ↔ zsh `detect_profile`
  (`config/zsh/.config/zsh/profile.zsh`), guarded by `profile_test.go`; and the
  stow ignore-matching logic in `matchesIgnore` (`tools/doctor/symlinks.go`) ↔
  `is_ignored` (`tests/unit/stow-conflicts.bats`).

## Adding a dotup subcommand

`dotup` subcommands are declared in four places that must stay in sync. The
`dotup-*` files in `config/bin/.local/bin/` are the source of truth. When adding,
renaming, or removing one, update all of:

1. **The file** — `config/bin/.local/bin/dotup-<name>` (executable)
2. **Dispatcher** — `config/bin/.local/bin/dotup` (usage line + full-run chain)
3. **Completion** — `_dotup_completion` in `config/zsh/.config/zsh/functions.zsh`
4. **README** — the command table in `README.md`

`tests/unit/dotup-sync.bats` enforces that 2–4 match the `dotup-*` files; if it
fails, the diff names the subcommand that is out of sync.

## The doctor (`tools/doctor`)

Standalone Go module (`go@1.26.3` via devbox), no external deps. Five checks:
`symlinks`, `templates`, `profile`, `tools`, `daemons`. Flags: `--json`,
`--verbose`.

A compiled binary is platform-specific (these machines span arm64 macOS and
Arch Linux), so it is **not** committed. `config/bin/.local/bin/dotup-doctor` is
a wrapper that builds a per-machine binary into `~/.cache/dotfiles/` on first
run, rebuilding whenever a `tools/doctor/*.go` file is newer than the cache. No
rebuild-and-commit step is needed after editing the Go source.

Two entrypoints:

| Command             | Build mechanism         | Go used                 | Purpose                 |
| ------------------- | ----------------------- | ----------------------- | ----------------------- |
| `dotup doctor`      | wrapper → cached binary | system Go (brew/pacman) | day-to-day, any machine |
| `devbox run doctor` | `go run` (no cache)     | pinned 1.26.3           | repo dev / CI           |
