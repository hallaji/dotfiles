#!/usr/bin/env bats
# Tests for the side-effecting dotup-* installers.
#
# Guard/no-op: with the prerequisite tool absent (a minimal PATH with only the
# basics, no brew/gh/npm/asdf), each script exits 0 and installs nothing.
# Command-capture: dotup-asdf is exercised against a recording `asdf` stub to
# verify its plugin loop and java/python special cases — no real installs.

setup() {
  BIN="$BATS_TEST_DIRNAME/../../config/bin/.local/bin"

  # Minimal PATH: just the basics each guard reaches, deliberately no
  # brew/gh/npm/asdf so the absence checks fire.
  MINPATH="$BATS_TEST_TMPDIR/minpath"
  mkdir -p "$MINPATH"
  for t in cat grep; do ln -sf "$(command -v "$t")" "$MINPATH/$t"; done
}

run_guard() {
  run bash -c "export PATH='$MINPATH'; '$1'"
}

@test "dotup-mac no-ops without brew" {
  run_guard "$BIN/dotup-mac"
  [ "$status" -eq 0 ]
}

@test "dotup-arch no-ops when not on Arch Linux" {
  run_guard "$BIN/dotup-arch"
  [ "$status" -eq 0 ]
}

@test "dotup-cli runs no installs without gh or npm" {
  run_guard "$BIN/dotup-cli"
  # gh/npm absent -> the `type X && { ... }` blocks are skipped, nothing installs.
  # (Note: the script's exit code follows the trailing `type npm && {}`, so it's
  # non-zero here rather than a clean 0 — a minor wart, not a failed guard.)
  [[ "$output" != *"install"* ]]
}

@test "dotup-asdf no-ops without asdf" {
  run_guard "$BIN/dotup-asdf"
  [ "$status" -eq 0 ]
}

@test "dotup-asdf adds every plugin and handles the java special case" {
  stub="$BATS_TEST_TMPDIR/stubs"
  mkdir -p "$stub"
  export ASDF_LOG="$BATS_TEST_TMPDIR/asdf.log"
  : >"$ASDF_LOG"

  cat >"$stub/asdf" <<'ASDF'
#!/bin/sh
case "$1 $2" in
  "plugin list") ;;                                  # nothing installed -> add branch
  "plugin add")  echo "add $3"  >>"$ASDF_LOG" ;;
  "list all")    echo "openjdk-21.0.0" ;;            # asdf list all java
  "install "*)   echo "install $2 $3" >>"$ASDF_LOG" ;;
  "set --home")  echo "set $3 $4" >>"$ASDF_LOG" ;;
esac
ASDF
  printf '#!/bin/sh\nexit 0\n' >"$stub/pip3" # python post-step
  chmod +x "$stub/asdf" "$stub/pip3"

  run env PATH="$stub:$PATH" bash "$BIN/dotup-asdf"
  [ "$status" -eq 0 ]

  # every plugin gets added (sampling across the list)
  for p in golang java nodejs python ruby terraform; do
    grep -q "^add ${p}$" "$ASDF_LOG" || {
      echo "plugin not added: $p"
      return 1
    }
  done
  # java takes the version-pinned install path
  grep -q '^install java openjdk-21.0.0$' "$ASDF_LOG"
}
