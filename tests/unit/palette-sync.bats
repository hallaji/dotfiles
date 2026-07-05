#!/usr/bin/env bats
# Keeps every copy of the Catamaran palette in sync with the source of truth
# in config/env/.env: the nvim palette fallbacks, the intentionally hardcoded
# .vimrc theme, the tables in docs/PALETTE.md, and the generated docs/assets
# mockups. If one of these fails, fix the drifting copy (or run
# `devbox run palette-assets` for the mockups) — never relax the test.

setup() {
  REPO="$BATS_TEST_DIRNAME/../.."
  ENV_FILE="$REPO/config/env/.env"
  LUA_FILE="$REPO/config/neovim/.config/nvim/lua/palettes/catamaran.lua"
  VIMRC="$REPO/config/vim/.vimrc"
  DOC="$REPO/docs/PALETTE.md"
}

# Layer 1 from .env, one NAME=#hex per line
env_colors() {
  grep -E '^export PALETTE_[A-Z0-9_]+="#[0-9a-f]{6}"' "$ENV_FILE" |
    sed -E 's/^export (PALETTE_[A-Z0-9_]+)="(#[0-9a-f]{6})"$/\1=\2/' | sort
}

# Layer 2 from .env, one NAME=TARGET per line
env_roles() {
  grep -E '^export PALETTE_[A-Z0-9_]+="\$PALETTE_[A-Z0-9_]+"' "$ENV_FILE" |
    sed -E 's/^export (PALETTE_[A-Z0-9_]+)="\$(PALETTE_[A-Z0-9_]+)"$/\1=\2/' | sort
}

@test "nvim palette fallbacks match the .env named colors" {
  lua=$(grep -oE 'get_color\("PALETTE_[A-Z0-9_]+", "#[0-9a-f]{6}"\)' "$LUA_FILE" |
    sed -E 's/get_color\("(PALETTE_[A-Z0-9_]+)", "(#[0-9a-f]{6})"\)/\1=\2/' | sort)
  diff <(env_colors) <(printf '%s\n' "$lua")
}

@test "nvim role fallbacks chain to the same colors as the .env aliases" {
  lua=$(grep -oE 'get_color\("PALETTE_[A-Z0-9_]+", c\.[a-z0-9]+\)' "$LUA_FILE" |
    sed -E 's/get_color\("(PALETTE_[A-Z0-9_]+)", c\.([a-z0-9]+)\)/\1=\2/' |
    awk -F= '{print $1 "=PALETTE_" toupper($2)}' | sort)
  diff <(env_roles) <(printf '%s\n' "$lua")
}

@test ".vimrc gui colors are palette members (plus the vim-only diff tints)" {
  allow='#12352f #3a1c28 #2a3240'
  palette=$(env_colors | cut -d= -f2)
  while IFS= read -r hex; do
    if ! grep -qx "$hex" <<<"$palette" && [[ " $allow " != *" $hex "* ]]; then
      echo "hex not in palette layer 1: $hex" >&2
      return 1
    fi
  done < <(grep -oE 'gui(fg|bg|sp)=#[0-9a-f]{6}' "$VIMRC" | cut -d= -f2 | sort -u)
}

@test "docs/PALETTE.md named-color table matches .env" {
  doc=$(grep -oE '^\| `PALETTE_[A-Z0-9_]+` \| `#[0-9a-f]{6}`' "$DOC" |
    sed -E 's/^\| `(PALETTE_[A-Z0-9_]+)` \| `(#[0-9a-f]{6})`/\1=\2/' | sort)
  diff <(env_colors) <(printf '%s\n' "$doc")
}

@test "docs/PALETTE.md role tables match .env" {
  doc=$(grep -oE '^\| `PALETTE_(CODE|UI|MODE)_[A-Z0-9_]+` \| `PALETTE_[A-Z0-9_]+`' "$DOC" |
    sed -E 's/^\| `(PALETTE_[A-Z0-9_]+)` \| `(PALETTE_[A-Z0-9_]+)`/\1=\2/' | sort)
  diff <(env_roles) <(printf '%s\n' "$doc")
}

@test "generated docs/assets mockups are up to date" {
  out="$BATS_TEST_TMPDIR/assets"
  bash "$REPO/scripts/render-palette-assets.sh" "$out"
  for svg in "$REPO"/docs/assets/*.svg; do
    diff "$svg" "$out/$(basename "$svg")"
  done
}
