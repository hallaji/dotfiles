# System Hotkeys Playbook

- **macOS** — [skhd](https://github.com/koekeishiya/skhd), a simple hotkey
  daemon launched by `dotup-services` alongside AeroSpace. Bindings below are
  taken from `config/skhd/.skhdrc`. It complements [AeroSpace](AEROSPACE.md):
  AeroSpace owns the `MEH` keyspace, skhd owns `HYPR`.
- **Linux** — global binds live in Hyprland's own `bind =`
  lines (`config/hyprland/.config/hypr/hyprland.conf`), since Hyprland is
  both the compositor and the hotkey daemon.

Also tracked here: [OS-level shortcuts](#os-level-shortcuts), global keys
configured through System Settings / app preferences rather than a stowed
config file, maintained by hand for both platforms.

- **`HYPR` = `⌃⇧⌥⌘`** (Control + Shift + Option + Command) — `MEH` plus `⌘`,
  skhd's (macOS-only) modifier convention.

---

## skhd (macOS)

| Keys              | Action                                                                      |
| ----------------- | --------------------------------------------------------------------------- |
| `HYPR + u`        | Toggle computer awake mode (Lungo)                                          |
| `HYPR + d`        | Show desktop (F11)                                                          |
| `HYPR + l`        | Lock screen                                                                 |
| `HYPR + Backtick` | Show/Hide the macOS menu bar (flagged `@FIXME` in `.skhdrc` — may not work) |
| `HYPR + Enter`    | End the current Zoom meeting, or join the next one                          |

> Tip: run `skhd -o` to print the keycode and modifiers of any key you press —
> handy when adding a binding for a key with no name (the `.skhdrc` footnote
> lists the ones already in use).

## Hyprland (Linux)

None configured yet — `hyprland.conf` still has only the stock example
binds (window management, not system-wide hotkeys). Update this section once
real global binds are added.

---

## OS-level shortcuts

Global shortcuts configured at the OS or app level (System Settings, app
preferences) rather than through a stowed config — so this section is
maintained **by hand**: entries are added here as they're set up and verified.
See also the keyboard [keymaps](../keyboards) and QMK
[keycodes](https://github.com/qmk/qmk_firmware/blob/master/docs/keycodes.md).

### Shared (macOS & Arch)

| Keys       | Action                                           |
| ---------- | ------------------------------------------------ |
| `HYPR + p` | Toggle 1Password quick-access search (1Password) |

### macOS

None verified yet.

| Keys | Action |
| ---- | ------ |
| —    | —      |

### Linux (Arch)

None verified yet.

| Keys | Action |
| ---- | ------ |
| —    | —      |

---

_Source of truth: `config/skhd/.skhdrc` for the skhd hotkeys,
`config/hyprland/.config/hypr/hyprland.conf` for Hyprland binds — update this
file in the same commit as a binding change. The OS-level shortcuts section
has no config file; keep it current as shortcuts are added or removed._
