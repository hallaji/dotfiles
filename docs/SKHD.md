# SKHD Playbook

A personal, config-accurate cheat-sheet for the system-wide macOS hotkeys.
Every keybinding below is taken from this repo's actual config —
`config/skhd/.skhdrc`. [skhd](https://github.com/koekeishiya/skhd) is a simple
hotkey daemon, launched by `dotup-services` alongside AeroSpace, borders and
sketchybar. It complements [AeroSpace](AEROSPACE.md): AeroSpace owns the `MEH`
keyspace, skhd owns `HYPR`.

- **`HYPR` = `⌃⇧⌥⌘`** (Control + Shift + Option + Command) — `MEH` plus `⌘`.
- Only the skhd hotkeys run through `.skhdrc`. Shortcuts defined at the OS or
  app level are tracked by hand in
  [OS-level shortcuts](#os-level-shortcuts) below.

---

## Hotkeys

| Keys              | Action                                                                      |
| ----------------- | --------------------------------------------------------------------------- |
| `HYPR + u`        | Toggle computer awake mode (Lungo)                                          |
| `HYPR + d`        | Show desktop (F11)                                                          |
| `HYPR + l`        | Lock screen                                                                 |
| `HYPR + Backtick` | Show/Hide the macOS menu bar (flagged `@FIXME` in `.skhdrc` — may not work) |
| `HYPR + Enter`    | End the current Zoom meeting, or join the next one                          |

`HYPR + Enter` is the clever one: it asks AeroSpace for a running Zoom meeting
window — if one exists it focuses and closes it (ending the meeting), otherwise
it forwards to `HYPR + j`, MeetingBar's join-next-meeting shortcut.

> Tip: run `skhd -o` to print the keycode and modifiers of any key you press —
> handy when adding a binding for a key with no name (the `.skhdrc` footnote
> lists the ones already in use).

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

_Source of truth: `config/skhd/.skhdrc` for the skhd hotkeys — update this
file in the same commit as a binding change. The OS-level shortcuts section
has no config file; keep it current as shortcuts are added or removed._
