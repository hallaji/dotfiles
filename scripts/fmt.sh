#!/usr/bin/env bash

# Apply formatters in place: shell (excluding zsh), Lua, and TOML.
# Run via `devbox run fmt` so the devbox-pinned tools are on PATH.
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

# Shell: shfmt -f skips hidden dirs (.devbox/.git); drop zsh, which shfmt can't parse.
while IFS= read -r f; do
  [ -n "$f" ] && shfmt -i 2 -w "$f"
done < <(shfmt -f . | grep -vE '\.zsh$|/dotup-shell$')

# Lua + TOML: restrict to git-tracked files so we never touch .devbox/.git/node_modules.
lua_files=$(git ls-files -- '*.lua')
[ -n "$lua_files" ] && printf '%s\n' "$lua_files" | xargs stylua --

toml_files=$(git ls-files -- '*.toml')
[ -n "$toml_files" ] && printf '%s\n' "$toml_files" | xargs taplo fmt --

# JSON: prettier honors .prettierignore (skips tool/app-managed files).
json_files=$(git ls-files -- '*.json')
[ -n "$json_files" ] && printf '%s\n' "$json_files" | xargs prettier --write --ignore-unknown
