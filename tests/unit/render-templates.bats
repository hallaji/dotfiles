#!/usr/bin/env bats
# Unit tests for config/bin/.local/bin/render-templates:
# ${VAR} substitution, :hex color conversion, and missing-file handling.
# Runs against a throwaway $HOME so it never touches real config.

setup() {
  SANDBOX="$(mktemp -d)"
  export HOME="$SANDBOX"
  RENDER="$BATS_TEST_DIRNAME/../../config/bin/.local/bin/render-templates"
}

teardown() {
  rm -rf "$SANDBOX"
}

@test "substitutes \${VAR} placeholders in a normal template" {
  mkdir -p "$HOME/.gnupg"
  printf "pinentry-program \${GPG_PIN}\n" >"$HOME/.gnupg/gpg.conf.template"

  GPG_PIN="/usr/bin/pinentry" bash "$RENDER"

  run cat "$HOME/.gnupg/gpg.conf"
  [ "$status" -eq 0 ]
  [ "$output" = "pinentry-program /usr/bin/pinentry" ]
}

@test "drops the .template suffix on the rendered output" {
  mkdir -p "$HOME/.gnupg"
  printf 'x\n' >"$HOME/.gnupg/gpg.conf.template"

  bash "$RENDER"

  [ -f "$HOME/.gnupg/gpg.conf" ]
}

@test ":hex template converts literal and substituted #rrggbb to 0xff" {
  mkdir -p "$HOME/.config/sketchybar"
  printf "bg=#1a2b3c\nfg=\${ACCENT}\n" >"$HOME/.config/sketchybar/colors.sh.template"

  ACCENT="#ffaa00" bash "$RENDER"

  run cat "$HOME/.config/sketchybar/colors.sh"
  [[ "$output" == *"bg=0xff1a2b3c"* ]]
  [[ "$output" == *"fg=0xffffaa00"* ]]
}

@test "non-:hex template leaves #rrggbb untouched" {
  mkdir -p "$HOME/.gnupg"
  printf 'color=#1a2b3c\n' >"$HOME/.gnupg/gpg.conf.template"

  bash "$RENDER"

  run cat "$HOME/.gnupg/gpg.conf"
  [[ "$output" == *"#1a2b3c"* ]]
  [[ "$output" != *"0xff"* ]]
}

@test "missing template files are skipped without error" {
  run bash "$RENDER"
  [ "$status" -eq 0 ]
}
