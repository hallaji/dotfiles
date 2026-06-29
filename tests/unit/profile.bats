#!/usr/bin/env bats
# Unit tests for config/zsh/.config/zsh/profile.zsh detect_profile().
# detect_profile is zsh, so it's exercised in a zsh subprocess.

setup() {
  PROFILE_ZSH="$BATS_TEST_DIRNAME/../../config/zsh/.config/zsh/profile.zsh"
}

@test "work hostname maps to CLTRMP" {
  run zsh -c "source '$PROFILE_ZSH'; detect_profile vhallaji-41NW96"
  [ "$status" -eq 0 ]
  [ "$output" = "CLTRMP" ]
}

@test "any other hostname maps to PRSNL" {
  run zsh -c "source '$PROFILE_ZSH'; detect_profile some-random-host"
  [ "$output" = "PRSNL" ]
}

@test "with no arg, falls back to \$(hostname) and returns a known profile" {
  run zsh -c "source '$PROFILE_ZSH'; detect_profile"
  [ "$status" -eq 0 ]
  [[ "$output" == "CLTRMP" || "$output" == "PRSNL" ]]
}

@test "work hostname maps to friendly display name" {
  run zsh -c "source '$PROFILE_ZSH'; display_hostname vhallaji-41NW96"
  [ "$status" -eq 0 ]
  [ "$output" = "Monomaran" ]
}

@test "catamaran hostname maps to friendly display name" {
  run zsh -c "source '$PROFILE_ZSH'; display_hostname catamaran.local"
  [ "$output" = "Catamaran" ]
}

@test "unknown hostname is capitalized (first letter upper, rest lower)" {
  run zsh -c "source '$PROFILE_ZSH'; display_hostname DEEP-THOUGHT"
  [ "$output" = "Deep-thought" ]
}

@test "display_hostname with no arg falls back to \$(hostname)" {
  run zsh -c "source '$PROFILE_ZSH'; display_hostname"
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}
