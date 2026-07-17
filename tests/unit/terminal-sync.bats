#!/usr/bin/env bats
# Enforces that the terminal keybindings stay mirrored 1:1 (see
# docs/TERMINAL.md): configs must encode the same chord -> tmux sequence map.
# Two deliberate exceptions are skipped: cmd+c (Alacritty's Copy action is a
# Ghostty default) and ctrl+q (an Alacritty-only bug workaround,
# alacritty#1359).

ALACRITTY_KEYBOARD="$BATS_TEST_DIRNAME/../../config/alacritty/.config/alacritty/alacritty.toml"
GHOSTTY_CONFIG="$BATS_TEST_DIRNAME/../../config/ghostty/.config/ghostty/config"

# Canonical chord: mods in ctrl,alt,shift,cmd order, then the key, lowercase.
# Accepts both the Alacritty ("Command|Shift" + "E") and Ghostty
# ("cmd+shift+e") spellings.
normalize_chord() {
  printf '%s\n' "$1" | awk -F'[|+]' '{
    ctrl = alt = shift = cmd = ""
    key = ""
    for (i = 1; i <= NF; i++) {
      t = tolower($i)
      if (t == "control" || t == "ctrl") ctrl = "ctrl+"
      else if (t == "alt" || t == "option" || t == "opt") alt = "alt+"
      else if (t == "shift") shift = "shift+"
      else if (t == "command" || t == "cmd" || t == "super") cmd = "cmd+"
      else key = t
    }
    if (key == "semicolon") key = ";"
    if (key == "return") key = "enter"
    if (key ~ /^key[0-9]$/) key = substr(key, 4)
    if (key ~ /^digit_[0-9]$/) key = substr(key, 7)
    print ctrl alt shift cmd key
  }'
}

# Canonical sequence: Alacritty \u00XX escapes become Ghostty \xXX, and the
# escaped double quote (\" / \x22) becomes a literal quote on both sides.
normalize_seq() {
  printf '%s\n' "$1" | sed \
    -e 's/\\u001B/\\x1b/g' \
    -e 's/\\u000E/\\x0e/g' \
    -e 's/\\u00/\\x/g' \
    -e 's/\\x22/"/g' \
    -e 's/\\"/"/g'
}

# Print "chord<TAB>sequence" per binding, sorted, in canonical form.
alacritty_bindings() {
  awk '
    function strip(v) { sub(/^[^"]*"/, "", v); sub(/"[^"]*$/, "", v); return v }
    function emit() {
      if (key != "" && chars != "") print chars "\t" key "\t" mods
      chars = ""; key = ""; mods = ""
    }
    /^\[\[keyboard\.bindings\]\]/ { emit(); next }
    /^chars *=/ { chars = strip($0); next }
    /^key *=/ { key = strip($0); next }
    /^mods *=/ { mods = strip($0); next }
    END { emit() }
  ' "$ALACRITTY_KEYBOARD" |
    while IFS=$'\t' read -r chars key mods; do
      chord="$(normalize_chord "${mods:+$mods|}$key")"
      [ "$chord" = "ctrl+q" ] && continue
      printf '%s\t%s\n' "$chord" "$(normalize_seq "$chars")"
    done | sort
}

ghostty_bindings() {
  sed -n 's/^keybind *= *//p' "$GHOSTTY_CONFIG" |
    while IFS= read -r line; do
      action="${line#*=}"
      case "$action" in
      text:*) ;;
      *) continue ;;
      esac
      printf '%s\t%s\n' "$(normalize_chord "${line%%=*}")" \
        "$(normalize_seq "${action#text:}")"
    done | sort
}

@test "alacritty and ghostty keybindings encode the same sequences" {
  # On failure the diff names the drifted binding: < alacritty, > ghostty.
  diff <(alacritty_bindings) <(ghostty_bindings)
}

@test "the binding parsers actually extract bindings" {
  [ "$(alacritty_bindings | wc -l)" -ge 30 ]
  [ "$(ghostty_bindings | wc -l)" -ge 30 ]
}
