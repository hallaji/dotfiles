#!/usr/bin/env bats
# Unit tests for config/bin/.local/bin/dotup-personal.
#
# Runs end-to-end against a sandbox HOME/XDG_PERSONAL_HOME with fzf stubbed.
# read_secret (the interactive /dev/tty path) is only reached on a non-empty fzf
# selection, so a no-op fzf stub keeps most of the run non-interactive. The
# *masked echo* behaviour needs a pty and stays out of scope. The no-tty
# degradation is covered below, but only when there is no controlling terminal
# (CI): with one, read_secret blocks on real keystrokes, so that test skips to
# avoid hanging an interactive run. The var list is read from the real repo spec
# (config/env/.env.personal.spec) via DOTFILES_HOME.

setup() {
  SANDBOX="$(mktemp -d)"
  export HOME="$SANDBOX"
  # Override so the script can never touch the real ~/.local/personal/env.
  export XDG_PERSONAL_HOME="$SANDBOX/.local/personal"
  # Point at the repo so dotup-personal finds the shared personal var spec.
  export DOTFILES_HOME="$BATS_TEST_DIRNAME/../.."
  ENV_FILE="$XDG_PERSONAL_HOME/env"
  DOTUP_PERSONAL="$BATS_TEST_DIRNAME/../../config/bin/.local/bin/dotup-personal"

  STUB="$SANDBOX/stubs"
  mkdir -p "$STUB"
  printf '#!/bin/sh\nexit 0\n' >"$STUB/fzf" # selects nothing
  chmod +x "$STUB/fzf"
}

teardown() {
  rm -rf "$SANDBOX"
}

# Run dotup-personal with the stub dir first on PATH.
run_personal() {
  run env PATH="$STUB:$PATH" bash "$DOTUP_PERSONAL"
}

# Portable octal file mode (GNU stat -c, BSD stat -f).
mode() {
  stat -c '%a' "$1" 2>/dev/null || stat -f '%Lp' "$1"
}

# Personal var names in spec order (the single source of truth).
spec_vars() {
  while IFS= read -r line; do
    line="${line%%#*}"
    line="${line//[[:space:]]/}"
    [ -z "$line" ] && continue
    printf '%s\n' "${line%%:*}"
  done <"$DOTFILES_HOME/config/env/.env.personal.spec"
}

@test "writes an export line for every var in the spec" {
  run_personal
  [ "$status" -eq 0 ]
  while IFS= read -r v; do
    grep -q "^export ${v}=" "$ENV_FILE" || {
      echo "missing: $v"
      return 1
    }
  done < <(spec_vars)
}

@test "writes the env file in the same order as the spec" {
  run_personal
  [ "$status" -eq 0 ]
  # The export lines must appear in exactly the spec's order.
  local file_order
  file_order="$(sed -n 's/^export \([^=]*\)=.*/\1/p' "$ENV_FILE")"
  [ "$(spec_vars)" = "$file_order" ] || {
    echo "spec order:"
    spec_vars
    echo "file order:"
    printf '%s\n' "$file_order"
    return 1
  }
}

@test "preserves existing saved values when nothing is selected" {
  mkdir -p "$XDG_PERSONAL_HOME"
  cat >"$ENV_FILE" <<'EOF'
export GITHUB_ACCESS_TOKEN="tok-1"
export GITHUB_REGISTRY_TOKEN="tok-2"
export GITHUB_USER="vahid"
export OP_SERVICE_ACCOUNT_TOKEN="op-tok"
export SIGNING_KEY_GPG="gpg-key"
export SIGNING_KEY_SSH="ssh-key"
export GIT_USER_EMAIL="me@example.com"
export GIT_USER_NAME="Me"
EOF

  run_personal
  [ "$status" -eq 0 ]
  grep -q '^export GITHUB_ACCESS_TOKEN="tok-1"' "$ENV_FILE"
  grep -q '^export GITHUB_REGISTRY_TOKEN="tok-2"' "$ENV_FILE"
  grep -q '^export GITHUB_USER="vahid"' "$ENV_FILE"
  grep -q '^export OP_SERVICE_ACCOUNT_TOKEN="op-tok"' "$ENV_FILE"
  grep -q '^export SIGNING_KEY_SSH="ssh-key"' "$ENV_FILE"
  grep -q '^export GIT_USER_EMAIL="me@example.com"' "$ENV_FILE"
  grep -q '^export GIT_USER_NAME="Me"' "$ENV_FILE"
  # Off-spec vars (SIGNING_KEY_GPG is commented out of the spec) are dropped.
  ! grep -q '^export SIGNING_KEY_GPG=' "$ENV_FILE"
}

@test "personal dir is mode 700 and env file is mode 600" {
  run_personal
  [ "$status" -eq 0 ]
  [ "$(mode "$XDG_PERSONAL_HOME")" = "700" ]
  [ "$(mode "$ENV_FILE")" = "600" ]
}

@test "preserves values that contain spaces" {
  mkdir -p "$XDG_PERSONAL_HOME"
  cat >"$ENV_FILE" <<'EOF'
export GITHUB_ACCESS_TOKEN=""
export GITHUB_REGISTRY_TOKEN=""
export GITHUB_USER=""
export OP_SERVICE_ACCOUNT_TOKEN=""
export SIGNING_KEY_SSH=""
export GIT_USER_EMAIL="john@example.com"
export GIT_USER_NAME="John Doe"
EOF

  run_personal
  [ "$status" -eq 0 ]
  grep -q '^export GIT_USER_NAME="John Doe"' "$ENV_FILE"
  grep -q '^export GIT_USER_EMAIL="john@example.com"' "$ENV_FILE"
}

@test "fails with a friendly error and preserves the file when the write fails" {
  mkdir -p "$XDG_PERSONAL_HOME"
  cat >"$ENV_FILE" <<'EOF'
export GITHUB_ACCESS_TOKEN="keep-me"
EOF

  # Force the atomic write to fail at the temp-file step.
  printf '#!/bin/sh\nexit 1\n' >"$STUB/mktemp"
  chmod +x "$STUB/mktemp"

  run env PATH="$STUB:$PATH" bash "$DOTUP_PERSONAL" 2>&1
  [ "$status" -ne 0 ]
  [[ "$output" == *"Failed to save personal settings"* ]]
  # Must not claim success on failure.
  [[ "$output" != *"Personal settings saved"* ]]
  # The existing env file must be left untouched.
  grep -q '^export GITHUB_ACCESS_TOKEN="keep-me"' "$ENV_FILE"
}

@test "secret-var entry completes under set -e when stty/tty control fails" {
  # Regression: read_secret runs stty and reads </dev/tty with their errors
  # hidden by 2>/dev/null. Under `set -e` a single failure used to abort the
  # whole script silently — the original bug was machine-specific, striking only
  # where stty/tty control misbehaved. Two stubs reproduce that deterministically:
  #   * stty exits non-zero  -> forces the tty-control failure the `|| true`
  #     guards (a real pty's stty would succeed and never exercise the fix);
  #   * fzf selects a secret  -> routes into read_secret.
  # `script` then gives read_secret a real pty so its </dev/tty read returns on
  # the fed newline instead of blocking. With the guards the script still saves;
  # without them set -e aborts before the save. `script`'s CLI differs by flavour.
  command -v script >/dev/null || skip "needs 'script' to allocate a pty"

  printf '#!/bin/sh\necho GITHUB_ACCESS_TOKEN\n' >"$STUB/fzf" # selects a secret
  chmod +x "$STUB/fzf"
  printf '#!/bin/sh\nexit 1\n' >"$STUB/stty" # force tty-control failure
  chmod +x "$STUB/stty"

  if script --version 2>/dev/null | grep -qi util-linux; then
    # util-linux: -q quiet, -e return child's exit, -c CMD, trailing logfile.
    run bash -c "export PATH='$STUB:'\$PATH
      printf '\n' | script -qe -c 'bash \"$DOTUP_PERSONAL\"' /dev/null"
  else
    # BSD/macOS: script [-q] logfile [command ...].
    run bash -c "export PATH='$STUB:'\$PATH
      printf '\n' | script -q /dev/null bash '$DOTUP_PERSONAL'"
  fi

  [ "$status" -eq 0 ]
  [[ "$output" == *"Personal settings saved"* ]]
  grep -q '^export GITHUB_ACCESS_TOKEN=' "$ENV_FILE"
}

@test "warns and keeps first line when a saved value contains a newline" {
  mkdir -p "$XDG_PERSONAL_HOME"
  # Simulate a multi-line value in the env file (e.g. someone pasted a token
  # with a trailing newline and it was written literally by the script).
  {
    printf 'export GITHUB_ACCESS_TOKEN=""\n'
    printf 'export GITHUB_REGISTRY_TOKEN=""\n'
    printf 'export GITHUB_USER=""\n'
    printf 'export OP_SERVICE_ACCOUNT_TOKEN=""\n'
    printf 'export SIGNING_KEY_SSH=""\n'
    printf 'export GIT_USER_EMAIL=""\n'
    printf "export GIT_USER_NAME=\"line one\nline two\"\n"
  } >"$ENV_FILE"

  # Merge stderr so we can assert the warning message.
  run env PATH="$STUB:$PATH" bash "$DOTUP_PERSONAL" 2>&1
  [ "$status" -eq 0 ]
  [[ "$output" == *"Warning"*"GIT_USER_NAME"* ]]
  grep -q '^export GIT_USER_NAME="line one"' "$ENV_FILE"
}
