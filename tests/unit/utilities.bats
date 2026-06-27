#!/usr/bin/env bats
# Smoke tests for the bin/ utility scripts.

setup() {
  BIN="$BATS_TEST_DIRNAME/../../config/bin/.local/bin"
  STUB="$BATS_TEST_TMPDIR/stubs"
  mkdir -p "$STUB"
}

@test "quote prints a quote (lolcat stubbed as pass-through)" {
  printf '#!/bin/sh\nexec cat\n' >"$STUB/lolcat"
  chmod +x "$STUB/lolcat"

  run env PATH="$STUB:$PATH" bash "$BIN/quote"
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "print-colors emits the 0..255 color cells" {
  run env TERM=xterm-256color bash "$BIN/print-colors"
  [ "$status" -eq 0 ]
  [[ "$output" == *" 0 "* ]]
  [[ "$output" == *" 255 "* ]]
}

@test "to256 converts an RGB triple to a 256-color index" {
  command -v ruby >/dev/null || skip "ruby not installed"

  run ruby "$BIN/to256" 255 0 0
  [ "$status" -eq 0 ]
  [ "$output" = "196" ]

  run ruby "$BIN/to256" 0 0 0
  [ "$output" = "16" ]
}
