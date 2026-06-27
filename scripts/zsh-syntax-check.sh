#!/usr/bin/env bash
# Syntax-check zsh files with `zsh -n` (zsh has no shellcheck equivalent).
# Takes file paths as args; used by the pre-commit `zsh-syntax` hook.
set -uo pipefail

status=0
for f in "$@"; do
  zsh -n "$f" || status=1
done
exit "$status"
