#!/usr/bin/env bats
# Unit tests for config/bin/.local/bin/dotup (the subcommand router).
# Fake dotup-* stubs on PATH echo their name, so no real installs run.

setup() {
  DOTUP="$BATS_TEST_DIRNAME/../../config/bin/.local/bin/dotup"
  STUB="$BATS_TEST_TMPDIR/stubs"
  mkdir -p "$STUB"
  for sub in arch asdf cli mac personal services shell vim; do
    printf '#!/bin/sh\necho %s\n' "$sub" >"$STUB/dotup-$sub"
    chmod +x "$STUB/dotup-$sub"
  done
}

run_dotup() {
  run env PATH="$STUB:$PATH" bash "$DOTUP" "$@"
}

@test "dotup <sub> runs only that subcommand" {
  run_dotup cli
  [ "$status" -eq 0 ]
  [ "$output" = "cli" ]
}

@test "dotup with no args runs the full chain in order" {
  run_dotup
  [ "$status" -eq 0 ]
  expected=$'personal\narch\nasdf\ncli\nmac\nservices\nshell\nvim'
  [ "$output" = "$expected" ]
}
