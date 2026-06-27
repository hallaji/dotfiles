#!/usr/bin/env bats
# Guards against drift between the four places a dotup subcommand is declared.
#
# The dotup-* files in config/bin/.local/bin/ are the source of truth. Whenever
# a subcommand is added, renamed, or removed, these must all agree:
#   1. the dotup dispatcher chain (config/bin/.local/bin/dotup)
#   2. the _dotup_completion zsh helper (config/zsh/.config/zsh/functions.zsh)
#   3. the README command table
# If you are reading this because the test failed, update whichever source is
# missing the subcommand listed in the diff. See CLAUDE.md > "Adding a dotup
# subcommand" for the full checklist.

REPO="$BATS_TEST_DIRNAME/../.."

setup() {
  BIN="$REPO/config/bin/.local/bin"
  DISPATCH="$BIN/dotup"
  COMPLETION="$REPO/config/zsh/.config/zsh/functions.zsh"
  README="$REPO/README.md"
}

# Source of truth: every dotup-* file, with the dotup- prefix stripped, sorted.
canonical() {
  find "$BIN" -maxdepth 1 -name 'dotup-*' -exec basename {} \; |
    sed 's/^dotup-//' | sort
}

# Subcommands the dispatcher invokes: dotup-NAME lines, excluding dotup-"$1".
dispatcher_subs() {
  grep -oE '^\s*dotup-[a-z]+' "$DISPATCH" |
    sed 's/.*dotup-//' | sort
}

# Subcommands offered by tab completion: the 'name:desc' entries in the
# options=( ... ) array inside _dotup_completion.
completion_subs() {
  awk '/options=\(/{f=1;next} /^\s*\)/{f=0} f' "$COMPLETION" |
    grep -oE "'[a-z]+:" | tr -d "':" | sort
}

# Subcommands listed in the README table, excluding the bare `dotup` (Run all).
readme_subs() {
  grep -E '^\|' "$README" | grep -oE '`dotup [a-z]+`' |
    sed -E 's/`dotup ([a-z]+)`/\1/' | sort
}

@test "dispatcher chain matches the dotup-* files" {
  diff <(canonical) <(dispatcher_subs)
}

@test "zsh completion matches the dotup-* files" {
  diff <(canonical) <(completion_subs)
}

@test "README table matches the dotup-* files" {
  diff <(canonical) <(readme_subs)
}
