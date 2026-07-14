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
anything stale or not yet rendered. `stale` is usually legitimate, not a bug: a
referenced value changed (e.g. `dotup personal` rotated a token) and the file
hasn't been re-rendered yet — it refreshes at the next login or immediately via
`render-templates`. The check renders against the doctor's **current**
environment, inherited from the invoking shell; `dotup doctor` and
`devbox run doctor` agree because both inherit it. (A genuinely stripped
environment — e.g. CI with no `.env`/personal vars loaded — would mis-flag
env-dependent files, but the normal entrypoints don't.)

The color palette in `config/env/.env` is two-layered: named colors (the only
place hex literals live) and `CODE_*`/`UI_*`/`MODE_*` role aliases. **Edit
hexes only in the named-color layer.** `tests/unit/palette-sync.bats` enforces
that the intentionally hardcoded copies (nvim fallbacks, `.vimrc`,
`docs/PALETTE.md`, the generated `docs/assets` mockups) stay in sync;
regenerate the mockups with `devbox run palette-assets`. See `docs/PALETTE.md`.

## Toolchain

Tools are pinned in `devbox.json`. Run everything through devbox so versions
match CI:

- `devbox run lint` — pre-commit hooks (shellcheck, shfmt, gofmt, yamllint, prettier, …)
- `devbox run fmt` — auto-format
- `devbox run test` — bats unit tests in `tests/unit`
- `devbox run doctor` — health checks (Go CLI in `tools/doctor`)

Run a single test:

- bats: `devbox run -- bats tests/unit/<file>.bats` (add `-f "<name regex>"` to
  narrow to one test case)
- Go: `devbox run -- sh -c "cd tools/doctor && go test -run <TestName> ./..."`

## Conventions

- Commit messages follow Conventional Commits: `type(scope): summary` with types
  like `feat`, `fix`, `perf`, `chore`, `docs`, `refactor`, `test`. The body, if
  any, is one short plain paragraph of at most 3 lines describing the change —
  no bullet lists, no trailers.
- Shell scripts: `#!/usr/bin/env bash` or `zsh`, formatted with shfmt, clean
  under shellcheck. Go is formatted with `gofmt` (both via `devbox run fmt`) and
  enforced by a `gofmt` pre-commit hook; `go vet`/`go test` run in CI. Note
  `gofmt`/`go test` only see **tracked** files — stage new Go before relying on
  the lint to check it.
- Tests assert **correct** behavior and must fail when the script is broken —
  never encode current broken behavior as expected.
- Shell tests go in `tests/unit/*.bats`, sandboxed via `HOME`/`XDG_PERSONAL_HOME`
  with stub binaries on `PATH` (no real installs or network). Go tests live
  beside the code in `tools/doctor/*_test.go` (`go test ./...`, run in CI).
- The hostname mappings (`detect_profile`, `display_hostname`) live only in
  `config/zsh/.config/zsh/profile.zsh`; the doctor's `profile` check sources
  that file and runs them rather than duplicating the logic in Go.
- Some helpers are mirrored across languages and must be edited together: the
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

## Documentation

User-facing docs in `docs/` are derived from config and must be updated **in the
same change** that alters the underlying behavior. No test enforces this (the
docs are prose, with no machine-readable contract to the configs), so it is a
manual convention — when you touch a keybinding or shortcut, update its doc.

Keybindings are documented in per-tool playbooks — each config-accurate, with
a muscle-memory starter and a Mermaid keyspace chart. Keybinding detail lives
only in the playbooks:

- `docs/NEOVIM.md` — all editor bindings (sourced from `config/{vim,neovim}/**`
  mappings).
- `docs/AEROSPACE.md` — the AeroSpace bindings (sourced from
  `config/aerospace/.aerospace.toml`).
- `docs/HOTKEYS.md` — system-wide hotkeys: skhd on macOS (sourced from
  `config/skhd/.skhdrc`) and Hyprland's global binds on Linux (sourced from
  `config/hyprland/.config/hypr/hyprland.conf`, currently unconfigured), plus
  a hand-maintained "OS-level shortcuts" section (macOS and Arch) for global
  keys with no stowed config.
- `docs/TMUX.md` — the tmux bindings (sourced from `config/tmux/.tmux.conf`).
- `docs/TERMINAL.md` — the terminal emulators (Alacritty, sourced from
  `config/alacritty/.config/alacritty/alacritty.toml`, and Ghostty, from
  `config/ghostty/.config/ghostty/config`). Each terminal keeps its whole
  config in that one file, with only the color palette split out into a
  separate rendered-from-template file (`colors.toml` / `colors`). The
  keybindings are identical across both, so the doc lists them once; a
  per-terminal section covers Ghostty's translation rules, deliberate
  differences, and behavior parity. `alacritty.toml` is the binding source of
  truth. Changing a binding in one terminal means making the same change in the
  other: `tests/unit/terminal-sync.bats` diffs the two configs' chord→sequence
  maps and fails on drift (behavior/docs parity stays a manual convention).
  Adding a third terminal just means porting the chords and listing it there.
- `docs/ZSH.md` — the zsh vi-mode line-editing bindings (sourced from
  `config/zsh/.config/zsh/bindings.zsh`, plus the `,f`/`,o` helpers in
  `functions.zsh`).
- `docs/BROWSER.md` — the Vimium/Vimari browser keys. All keys are extension
  defaults; `config/vimium/.config/vimium/vimium-options.json` only customises
  behavior (exclusions, hints, search). Vimari has no repo config.

`docs/CLIPBOARD.md` documents the clipboard flow across tmux/zsh/Alacritty/Ghostty, and
`README.md`'s command table tracks `dotup` subcommands (see "Adding a dotup
subcommand"). Keep both current when the relevant behavior changes.
`docs/ARCHITECTURE.md` (stow → templates → provisioning → doctor lifecycle, with
a Mermaid diagram) must be refreshed when that flow changes. `docs/PALETTE.md`
documents the color palette (swatches, role tables, generated mockups); its
tables and the `docs/assets/*.svg` mockups are checked against
`config/env/.env` by `tests/unit/palette-sync.bats`, so update it in the same
change as any palette edit and re-run `devbox run palette-assets`.

`docs/NEOVIM.md` is a config-accurate Neovim playbook: every keybinding is
drawn from the real config, not Vim defaults. Its source of truth is
`config/neovim/.config/nvim/lua/config/mappings.lua` plus the per-plugin
`keys`/`config` specs in `config/neovim/.config/nvim/lua/plugins/*.lua`. When
you add, remove, or rebind a Neovim mapping — or add/remove a plugin that owns
keymaps — update `docs/NEOVIM.md` in the same change. It is the **only** doc
for editor bindings. If a task area has no custom binding, the doc states so
and gives the plugin/Vim default, clearly labelled — preserve that
distinction.

macOS window management is **AeroSpace** (launched by `dotup-services` alongside
skhd, borders, sketchybar), documented in `docs/AEROSPACE.md` with the skhd
hotkeys in `docs/HOTKEYS.md` — like NEOVIM.md, these are the only docs for those
bindings and must be updated in the same change as the config. The `yabai`
package is legacy and is no longer started — don't document yabai bindings as
current.

## The doctor (`tools/doctor`)

Standalone Go module (via devbox), no external deps. Eight checks:
`symlinks`, `templates`, `env`, `personal-env`, `profile`, `tools`, `daemons`,
`parsers`. Flags: `--json`, `--verbose`.

The `parsers` check parses the `ensure_installed` list out of
`config/neovim/.config/nvim/lua/plugins/treesitter.lua` (the single source of
truth — don't duplicate the list in Go) and verifies each language has a
compiled parser and queries dir under Neovim's `site/` data dir. Missing
parsers are a `warn`, not a `fail`: tree-sitter-manager reinstalls them in the
background on the next Neovim launch.

The `env` check parses `config/env/.env` (stowed to `~/.env`, sourced by
`.zshenv`) and reports how many of its top-level `export` vars are loaded in
the doctor's inherited environment. Predictable values (literals, `$VAR`
references resolvable within the file) are also compared and flagged `stale`
when the running shell has not re-sourced `~/.env` since an edit. Values the
shell computes at source time (command substitution, PATH-style
self-references, `${...}` parameter expansion, leading `~`) are checked for
presence only, and indented exports inside OS conditionals are skipped because
the doctor cannot evaluate the branch.

The `personal-env` check reads `config/env/.env.personal.spec` — the single source of
truth for the personal env vars, also consumed by `dotup-personal` — and reports
which are populated in `$XDG_PERSONAL_HOME/env`.
Secret-tagged entries are reported `set`/valid/`missing` only and their **values
are never printed** (including under `--json`); non-secrets show their value. It
live-validates credentials: the GitHub tokens via `gh api user` and the
1Password token via `op` (both shell out to required tools; a network failure
degrades to `unverified`, not a hard fail). To add or rename a personal var,
edit only the spec — both consumers read it.

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
