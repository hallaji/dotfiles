#!/usr/bin/env bats
# Unit tests for config/bin/.local/bin/dotup-personal.
#
# Runs end-to-end against a sandbox HOME/XDG_PERSONAL_HOME with fzf and op
# stubbed. read_secret (the interactive /dev/tty path) is only reached on a
# non-empty fzf selection, so a no-op fzf stub keeps the whole run
# non-interactive — that path is intentionally out of scope (needs a pty).

setup() {
  SANDBOX="$(mktemp -d)"
  export HOME="$SANDBOX"
  # Override so the script can never touch the real ~/.local/personal/env.
  export XDG_PERSONAL_HOME="$SANDBOX/.local/personal"
  ENV_FILE="$XDG_PERSONAL_HOME/env"
  DOTUP_PERSONAL="$BATS_TEST_DIRNAME/../../config/bin/.local/bin/dotup-personal"

  STUB="$SANDBOX/stubs"
  mkdir -p "$STUB"
  printf '#!/bin/sh\nexit 0\n' >"$STUB/fzf" # selects nothing
  printf '#!/bin/sh\nexit 0\n' >"$STUB/op"  # no op output by default
  chmod +x "$STUB/fzf" "$STUB/op"
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

@test "writes an export line for each of the 8 personal vars" {
  run_personal
  [ "$status" -eq 0 ]
  for v in GITHUB_ACCESS_TOKEN GITHUB_REGISTRY_TOKEN GITHUB_USER \
    OP_SERVICE_ACCOUNT_TOKEN SIGNING_KEY_GPG SIGNING_KEY_SSH \
    GIT_USER_EMAIL GIT_USER_NAME; do
    grep -q "^export ${v}=" "$ENV_FILE" || {
      echo "missing: $v"
      return 1
    }
  done
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
  grep -q '^export SIGNING_KEY_GPG="gpg-key"' "$ENV_FILE"
  grep -q '^export SIGNING_KEY_SSH="ssh-key"' "$ENV_FILE"
  grep -q '^export GIT_USER_EMAIL="me@example.com"' "$ENV_FILE"
  grep -q '^export GIT_USER_NAME="Me"' "$ENV_FILE"
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
export SIGNING_KEY_GPG=""
export SIGNING_KEY_SSH=""
export GIT_USER_EMAIL="john@example.com"
export GIT_USER_NAME="John Doe"
EOF

  run_personal
  [ "$status" -eq 0 ]
  grep -q '^export GIT_USER_NAME="John Doe"' "$ENV_FILE"
  grep -q '^export GIT_USER_EMAIL="john@example.com"' "$ENV_FILE"
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
    printf 'export SIGNING_KEY_GPG=""\n'
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

@test "1Password check passes for a SERVICE_ACCOUNT/CLI token" {
  cat >"$STUB/op" <<'OP'
#!/bin/sh
printf '%s\n' '{"type": "SERVICE_ACCOUNT", "name": "CLI"}'
OP
  chmod +x "$STUB/op"

  run_personal
  [ "$status" -eq 0 ]
  [[ "$output" == *"verified"* ]]
}

@test "1Password check fails for a non-service-account token" {
  cat >"$STUB/op" <<'OP'
#!/bin/sh
printf '%s\n' '{"type": "PERSON", "name": "Vahid"}'
OP
  chmod +x "$STUB/op"

  run_personal
  [ "$status" -eq 0 ]
  [[ "$output" == *"check failed"* ]]
}
