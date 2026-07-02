# Architecture

How this repo becomes a configured machine — and how it stays honest.

```mermaid
flowchart TD
    subgraph repo["~/.dotfiles (git repo)"]
        direction LR
        pkgs["config/&lt;pkg&gt;/<br/>zsh · tmux · alacritty · aerospace · nvim · …"]:::repo
        tmpl["*.template<br/>(${VAR} placeholders)"]:::repo
        env["config/env/.env<br/>+ .env.personal.spec"]:::repo
        toolchain["devbox.json ·<br/>tools/doctor/*.go"]:::repo
    end

    subgraph prov["dotup (provisioning)"]
        direction TB
        dispatch["dotup (dispatcher)"]:::prov
        dispatch --> personal["personal"]:::prov
        dispatch --> osinst["mac / arch<br/>(brew / pacman)"]:::prov
        dispatch --> tools["cli · shell · asdf · vim"]:::prov
        dispatch --> svc["services"]:::prov
    end

    pstore[("$XDG_PERSONAL_HOME/env<br/>secrets & per-machine values")]:::store
    links["<b>$HOME symlinks</b><br/>~/.zshrc · ~/.tmux.conf · *.template …"]:::out
    rt["render-templates<br/>(.zprofile, at login)<br/>expand ${VAR} · :hex #rrggbb→0xffrrggbb"]:::run
    rendered["<b>rendered files</b><br/>~/.gitconfig · colors.sh …"]:::out
    daemons["<b>login services</b><br/>macOS: aerospace · skhd · borders · sketchybar<br/>Linux: Hyprland"]:::run
    doctor["<b>doctor</b> — validates the result<br/>symlinks · templates · profile<br/>personal · tools · daemons"]:::check

    %% Main spine (top → bottom).
    pkgs -->|"stow -R · .stowrc (--no-folding)"| links
    tmpl -->|"stowed as-is"| links
    links -->|"at login"| rt
    rt --> rendered
    rendered -->|"read at launch"| daemons
    daemons --> doctor

    %% Provisioning side-flow.
    personal --> pstore
    svc --> daemons
    toolchain -.->|"wrapper builds (Go)"| doctor

    %% Per-machine values feed the render step.
    env --> rt
    pstore --> rt

    %% Colors from config/env/.env palette:
    %% repo  = #02d9fe (PALETTE_UI_BORDER)    prov  = #a394cd (PALETTE_SE_FOCUS)
    %% store = #ff75b5 (PALETTE_SE_SECONDARY) out   = #00e8c6 (PALETTE_SY_STRING)
    %% run   = #f5b168 (PALETTE_SE_WARNING)   check = #00b196 (PALETTE_SE_SUCCESS)
    %% subgraph frame = #515f72 (PALETTE_SY_COMMENT) / #8296aa (PALETTE_BA_TERTIARY_FG)
    classDef repo fill:transparent,stroke:#02d9fe,color:#02d9fe
    classDef prov fill:transparent,stroke:#a394cd,color:#a394cd
    classDef store fill:transparent,stroke:#ff75b5,stroke-width:2px,color:#ff75b5
    classDef out fill:transparent,stroke:#00e8c6,color:#00e8c6
    classDef run fill:transparent,stroke:#f5b168,color:#f5b168
    classDef check fill:transparent,stroke:#00b196,stroke-width:2px,color:#00b196
    style repo fill:transparent,stroke:#515f72,color:#8296aa
    style prov fill:transparent,stroke:#515f72,color:#8296aa
    linkStyle default stroke:#515f72,color:#8296aa
```

## Walkthrough

**Repo → `$HOME`.** GNU Stow, driven by `.stowrc`
(`--dir=./config --target=~ --no-folding`), symlinks each `config/<pkg>/`
package into `$HOME`. With `--no-folding`, real directories are created and
individual files are linked, so one real `~/.config/` can hold links from many
packages at once.

**Templates.** Config needing per-machine or secret values lives as `*.template`
files with `${VAR}` placeholders. They are stowed into `$HOME` like any other
file, then [`render-templates`](../config/bin/.local/bin/render-templates) —
invoked from `.zprofile` at login — expands them in place
(`~/.gitconfig.template` → `~/.gitconfig`) using `config/env/.env` plus your
out-of-repo personal values at `$XDG_PERSONAL_HOME/env` (managed by
`dotup personal`). Entries tagged `:hex` also convert `#rrggbb` →
`0xffrrggbb` for tools that need it (sketchybar, borders).

**Provisioning.** A single `dotup` dispatcher fans out to subcommands:
`personal` (writes the personal store), OS-split installers `mac`/`arch`
(Homebrew / pacman), the toolchain installers `cli`/`shell`/`asdf`/`vim`, and
`services`, which launches **aerospace · skhd · borders · sketchybar** on macOS
(Hyprland on Linux). Window management is AeroSpace; the `yabai` package is
legacy and is not started.

**Validation.** `dotup doctor` closes the loop, validating what provisioning
produced — `symlinks`, rendered `templates`, and running `daemons` — plus
`personal`, `tools`, and `profile`. The binary is built on demand from
`tools/doctor/*.go` by a wrapper (cached per machine), with Go pinned by devbox.

Two details left off the diagram for legibility:

- The `personal` check live-validates credentials (GitHub tokens via `gh api
user`, the 1Password token via `op`); a network failure degrades to
  `unverified` rather than failing.
- There are two doctor entrypoints — `dotup doctor` (cached binary, system Go)
  for day-to-day use, and `devbox run doctor` (`go run`, pinned Go) for repo
  dev / CI.

## Cross-platform (macOS / Linux)

A single `dotup` run executes every subcommand on both OSes; the OS-specific
installers **self-gate** — `dotup-mac` exits unless `brew` exists, `dotup-arch`
exits unless `/etc/os-release` says Arch — so the wrong-OS one is a no-op. The
shared core (stow, zsh, templates, tmux, alacritty, nvim, doctor, devbox) is
identical everywhere; only the platform backends differ.

```mermaid
flowchart LR
    core["Shared core<br/>stow · zsh · templates · render-templates<br/>tmux · alacritty · nvim · doctor · devbox"]:::core
    core --> gate{"OS guard<br/>(each installer self-gates)"}:::gate

    gate -->|"brew present"| mac["macOS · arm64<br/>dotup mac → Homebrew + casks"]:::mac
    gate -->|"/etc/os-release = Arch"| arch["Arch Linux<br/>dotup arch → pacman + AUR (yay) + snap"]:::linux

    mac --> macrt["WM: AeroSpace + skhd<br/>bar: SketchyBar · borders: JankyBorders<br/>launched by dotup services (launchd)"]:::mac
    arch --> linrt["WM: Hyprland (+ wofi / dmenu)<br/>clipboard: xclip<br/>session-managed (no dotup services yet)"]:::linux

    macrt --> dchk["doctor · daemons<br/>launchctl labels"]:::check
    linrt --> dchk2["doctor · daemons<br/>pgrep processes"]:::check

    %% Colors from config/env/.env palette:
    %% core = #02d9fe (PALETTE_UI_BORDER)   gate  = #a394cd (PALETTE_SE_FOCUS)
    %% mac  = #00e8c6 (PALETTE_SY_STRING)   linux = #f5b168 (PALETTE_SE_WARNING)
    %% check = #00b196 (PALETTE_SE_SUCCESS)
    classDef core fill:transparent,stroke:#02d9fe,color:#02d9fe
    classDef gate fill:transparent,stroke:#a394cd,color:#a394cd
    classDef mac fill:transparent,stroke:#00e8c6,color:#00e8c6
    classDef linux fill:transparent,stroke:#f5b168,color:#f5b168
    classDef check fill:transparent,stroke:#00b196,stroke-width:2px,color:#00b196
```

| Capability      | macOS (arm64)                                  | Linux (Arch)                             |
| --------------- | ---------------------------------------------- | ---------------------------------------- |
| Provisioning    | `dotup mac` — Homebrew formulae + casks        | `dotup arch` — pacman + yay (AUR) + snap |
| Window manager  | AeroSpace + skhd                               | Hyprland                                 |
| Status bar      | SketchyBar                                     | — (none yet)                             |
| Window borders  | JankyBorders (`borders`)                       | Hyprland native                          |
| App launcher    | Alfred                                         | wofi / dmenu                             |
| Service launch  | `dotup services` → launchd (brew services)     | Hyprland session (no dotup hook yet)     |
| `daemons` check | `launchctl` labels (skhd, sketchybar, borders) | `pgrep` (Hyprland)                       |
| Clipboard       | `pbcopy` / `pbpaste`                           | `xclip`                                  |
| Secrets / 2FA   | 1Password CLI + pinentry-mac                   | 1Password CLI + pam-u2f / libfido2       |

**Maturity:** macOS is the primary, fully wired setup; the Arch/Hyprland machine
is supported but minimal and still growing (the `daemons` check only watches
`Hyprland`). Two known parity gaps to close as Linux matures:

- `dotup services` only starts the macOS daemons; there is no Linux equivalent
  (e.g. `systemd --user` units) yet.
- The zsh vi-mode clipboard mirroring in `config/zsh/.config/zsh/bindings.zsh`
  hardcodes `pbcopy`/`pbpaste` (macOS-only); tmux copy/paste is already portable
  via tmux-yank. A portable `clip` helper would close this.

For keybindings see the per-tool playbooks — [NEOVIM.md](NEOVIM.md),
[AEROSPACE.md](AEROSPACE.md), [SKHD.md](SKHD.md), [TMUX.md](TMUX.md),
[ALACRITTY.md](ALACRITTY.md), [ZSH.md](ZSH.md) and [BROWSER.md](BROWSER.md) —
and [CLIPBOARD.md](CLIPBOARD.md) for the clipboard flow.
