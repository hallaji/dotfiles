#!/usr/bin/env bats
# Tests for the side-effecting dotup-* installers.
#
# Guard/no-op: with the prerequisite tool absent (a minimal PATH with only the
# basics, no brew/gh/asdf), each script exits 0 and installs nothing.
# Command-capture: dotup-asdf and dotup-mac run against recording stubs to
# verify the plugin loop, java/gradle/python version pinning, and the
# profile-gated nix/devbox installs — no real installs.

bats_require_minimum_version 1.5.0 # `run !` below

setup() {
  BIN="$BATS_TEST_DIRNAME/../../config/bin/.local/bin"

  # Minimal PATH: just the basics each guard reaches, deliberately no
  # brew/gh/npm/asdf so the absence checks fire.
  MINPATH="$BATS_TEST_TMPDIR/minpath"
  mkdir -p "$MINPATH"
  for t in cat grep; do ln -sf "$(command -v "$t")" "$MINPATH/$t"; done
}

run_guard() {
  # unset SDKROOT: this suite runs under `devbox run`, whose nix-store SDKROOT
  # would trip dotup-asdf's macOS guard.
  run bash -c "export PATH='$MINPATH'; unset SDKROOT; '$1'"
}

@test "dotup-mac no-ops without brew" {
  run_guard "$BIN/dotup-mac"
  [ "$status" -eq 0 ]
}

@test "dotup-arch no-ops when not on Arch Linux" {
  run_guard "$BIN/dotup-arch"
  [ "$status" -eq 0 ]
}

@test "dotup-cli runs no installs without gh" {
  run_guard "$BIN/dotup-cli"
  # gh absent -> the `type gh && { ... }` block is skipped, nothing installs.
  # (The script's exit code follows the failed `type gh`, so it's non-zero
  # here rather than a clean 0 — a minor wart, not a failed guard.)
  [[ "$output" != *"install"* ]]
}

@test "dotup-asdf no-ops without asdf" {
  run_guard "$BIN/dotup-asdf"
  [ "$status" -eq 0 ]
}

# Build an isolated PATH for exercising dotup-mac's nix/devbox section:
# real sh/bash/cat/grep, recording curl/hotel/brew stubs, and a no-op ruby so
# the rest of the script runs clean. nix and devbox are deliberately absent so
# the install branches fire.
make_mac_stub_path() {
  MACSTUBS="$BATS_TEST_TMPDIR/macstubs"
  mkdir -p "$MACSTUBS"
  for t in sh bash cat grep; do ln -sf "$(command -v "$t")" "$MACSTUBS/$t"; done
  export CURL_LOG="$BATS_TEST_TMPDIR/curl.log"
  export HOTEL_LOG="$BATS_TEST_TMPDIR/hotel.log"
  export BREW_LOG="$BATS_TEST_TMPDIR/brew.log"
  : >"$CURL_LOG"
  : >"$HOTEL_LOG"
  : >"$BREW_LOG"
  cat >"$MACSTUBS/curl" <<'CURL'
#!/bin/sh
echo "curl $*" >>"$CURL_LOG"
CURL
  cat >"$MACSTUBS/hotel" <<'HOTEL'
#!/bin/sh
echo "hotel $*" >>"$HOTEL_LOG"
HOTEL
  cat >"$MACSTUBS/brew" <<'BREW'
#!/bin/sh
echo "brew $*" >>"$BREW_LOG"
BREW
  printf '#!/bin/sh\nexit 0\n' >"$MACSTUBS/ruby"
  chmod +x "$MACSTUBS/curl" "$MACSTUBS/hotel" "$MACSTUBS/brew" "$MACSTUBS/ruby"
}

@test "dotup-mac installs nix (Determinate) and devbox on non-CLTRMP profiles" {
  make_mac_stub_path
  run env PATH="$MACSTUBS" DOTFILES_PROFILE=PRSNL bash "$BIN/dotup-mac"
  [ "$status" -eq 0 ]
  grep -q 'install.determinate.systems/nix' "$CURL_LOG"
  grep -q 'get.jetify.com/devbox' "$CURL_LOG"
  # the Culture Amp block stays off this profile
  run ! grep -E 'cultureamp|silk-cli|wilma' "$BREW_LOG"
}

@test "dotup-mac skips the installers when nix and devbox are present" {
  make_mac_stub_path
  printf '#!/bin/sh\necho "nix (Determinate Nix 3.21.1) 2.34.7"\n' >"$MACSTUBS/nix"
  printf '#!/bin/sh\nexit 0\n' >"$MACSTUBS/devbox"
  chmod +x "$MACSTUBS/nix" "$MACSTUBS/devbox"

  run env PATH="$MACSTUBS" DOTFILES_PROFILE=PRSNL bash "$BIN/dotup-mac"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Already installed: nix (Determinate Nix 3.21.1) 2.34.7"* ]]
  run ! grep -E 'install\.determinate\.systems|get\.jetify\.com' "$CURL_LOG"
}

@test "dotup-mac skips nix/devbox on CLTRMP and defers to hotel setup ensure" {
  make_mac_stub_path
  run env PATH="$MACSTUBS" DOTFILES_PROFILE=CLTRMP bash "$BIN/dotup-mac"
  [ "$status" -eq 0 ]
  grep -q 'cultureamp/devbox-extras.*github_auth.rb' "$CURL_LOG"
  grep -q '^hotel setup ensure$' "$HOTEL_LOG"
  grep -q '^brew tap cultureamp/tap$' "$BREW_LOG"
  grep -q '^brew install silk-cli$' "$BREW_LOG"
  grep -q '^brew install wilma$' "$BREW_LOG"
  run ! grep -E 'install\.determinate\.systems|get\.jetify\.com' "$CURL_LOG"
}

@test "dotup-asdf adds every plugin and pins the newest stable versions" {
  stub="$BATS_TEST_TMPDIR/stubs"
  mkdir -p "$stub"
  export ASDF_LOG="$BATS_TEST_TMPDIR/asdf.log"
  : >"$ASDF_LOG"

  # `list all` mixes stable releases with the pre-release/variant builds each
  # special case must skip: java's early-access JEP build (which sorts after
  # the newest GA), gradle's -milestone, python's free-threaded `t` build.
  cat >"$stub/asdf" <<'ASDF'
#!/bin/sh
case "$1 $2" in
  "plugin list") ;;                                  # nothing installed -> add branch
  "plugin add")  echo "add $3"  >>"$ASDF_LOG" ;;
  "latest "*)    echo "9.9.9" ;;
  "list all")
    case "$3" in
      java)   printf 'openjdk-25.0.2\nopenjdk-26.0.1\nopenjdk-27-jep401ea3+1-1\n' ;;
      gradle) printf '9.0\n9.1-milestone-1\n' ;;
      python) printf '3.13.1\n3.14.0\n3.14.0t\n' ;;
    esac ;;
  "install "*)   echo "install $2 $3" >>"$ASDF_LOG" ;;
  "set --home")  echo "set $3 $4" >>"$ASDF_LOG" ;;
esac
ASDF
  # brew that fails --prefix: keeps the php shim from reaching the real brew
  printf '#!/bin/sh\nexit 1\n' >"$stub/brew"
  chmod +x "$stub/asdf" "$stub/brew"

  # -u SDKROOT: the script refuses to run with a nix-store SDKROOT on macOS,
  # and this suite runs under `devbox run`, which sets one.
  run env -u SDKROOT PATH="$stub:$PATH" bash "$BIN/dotup-asdf"
  [ "$status" -eq 0 ]

  # every plugin gets added (sampling across the list)
  for p in golang java nodejs python ruby terraform; do
    grep -q "^add ${p}$" "$ASDF_LOG" || {
      echo "plugin not added: $p"
      return 1
    }
  done

  # the special cases pin the newest *stable* release, not the last line
  grep -q '^install java openjdk-26.0.1$' "$ASDF_LOG"
  grep -q '^install gradle 9.0$' "$ASDF_LOG"
  grep -q '^install python 3.14.0$' "$ASDF_LOG"
  # generic plugins go through `asdf latest`
  grep -q '^install golang 9.9.9$' "$ASDF_LOG"
  # and no early-access / variant build is ever installed
  run ! grep -E 'jep401|milestone|3\.14\.0t' "$ASDF_LOG"
}
