#!/usr/bin/env bats
# Unit tests for config/zsh/.config/zsh/functions.zsh.
# Sourced in a zsh subprocess (bats runs under bash). The trailing `compdef`
# line errors outside an interactive shell, so stderr is suppressed — every
# function is defined before it runs, which is what we assert.

setup() {
  FUNCTIONS_ZSH="$BATS_TEST_DIRNAME/../../config/zsh/.config/zsh/functions.zsh"
  STUB="$BATS_TEST_TMPDIR/stubs"
  mkdir -p "$STUB"
}

@test "sourcing defines the logic-bearing functions" {
  run zsh -c "source '$FUNCTIONS_ZSH' 2>/dev/null; \
    typeset -f code_dirs stow_dotfiles add_gopath \
      aws_profile_names aws_config_decorate change_aws_profile \
      generate_aws_config change_gcloud_config start_ec2_session \
      toggle_sketchybar figlet_show >/dev/null"
  [ "$status" -eq 0 ]
}

@test "aws_profile_names prints sorted profile names from a config file" {
  cfg="$BATS_TEST_TMPDIR/aws_config"
  printf '%s\n' '[profile foo-eu/Role]' '[profile bar-au/Role]' '[profile baz]' >"$cfg"

  run zsh -c "source '$FUNCTIONS_ZSH' 2>/dev/null; aws_profile_names '$cfg'"
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "bar-au/Role" ]
  [ "${lines[1]}" = "baz" ]
  [ "${lines[2]}" = "foo-eu/Role" ]
}

@test "aws_config_decorate annotates granted profiles (stdin -> stdout)" {
  run zsh -c "source '$FUNCTIONS_ZSH' 2>/dev/null; \
    printf '%s\n' '[profile acme-eu/Role]' '[profile acme-au/Role]' '[profile acme-production]' \
    | aws_config_decorate"
  [ "$status" -eq 0 ]
  [[ "$output" == *"region = eu-west-1"* ]]
  [[ "$output" == *"region = ap-southeast-2"* ]]
  [[ "$output" == *"granted_icon = dollar"* ]]
}

# --- Tier B: branch logic via stubbed external tools ---

@test "change_gcloud_config reports when nothing is selected" {
  printf '#!/bin/sh\nprintf "%%s\\n" NAME foo bar\n' >"$STUB/gcloud"
  printf '#!/bin/sh\nexit 0\n' >"$STUB/fzf" # no selection
  chmod +x "$STUB/gcloud" "$STUB/fzf"

  run env PATH="$STUB:$PATH" zsh -c "source '$FUNCTIONS_ZSH' 2>/dev/null; change_gcloud_config"
  [[ "$output" == *"No GCloud config provided"* ]]
}

@test "toggle_sketchybar takes the hide branch when the bar is visible" {
  [[ "$OSTYPE" == darwin* ]] || skip "macOS-only (sketchybar/aerospace)"

  # Override DOTFILES_HOME so the function's sed targets a throwaway toml,
  # never the real ~/.dotfiles aerospace config.
  export DOTFILES_HOME="$BATS_TEST_TMPDIR/dot"
  mkdir -p "$DOTFILES_HOME/config/aerospace"
  printf 'outer.top = 46\n' >"$DOTFILES_HOME/config/aerospace/.aerospace.toml"

  cat >"$STUB/sketchybar" <<'SB'
#!/bin/sh
case "$*" in
  "--query bar") printf '%s\n' '{"hidden": "off"}' ;;
esac
SB
  printf '#!/bin/sh\nexit 0\n' >"$STUB/aerospace"
  chmod +x "$STUB/sketchybar" "$STUB/aerospace"

  run env PATH="$STUB:$PATH" zsh -c "source '$FUNCTIONS_ZSH' 2>/dev/null; toggle_sketchybar"
  [[ "$output" == *"Turning off SketchyBar"* ]]
}
