#!/usr/bin/env bats
# Verify no two config packages stow to the same target path.
#
# Simulates GNU Stow's --no-folding --dotfiles path resolution without running
# stow: strips the package prefix from each file path and applies the dot-
# prefix transformation, then asserts every resolved target is unique across
# all packages. Catches conflicts before they cause failures on a real machine.
#
# Honors the same ignore rules stow does:
#   - .stowrc: reads --dir to locate the package root
#   - .stow-global-ignore: global patterns applied to every package
#   - .stow-local-ignore: per-package patterns (e.g. keyboards ignores everything)

REPO="$BATS_TEST_DIRNAME/../.."

# Read --dir value from .stowrc; fall back to "config" if absent.
stow_dir() {
  grep -m1 '^--dir=' "$REPO/.stowrc" 2>/dev/null | cut -d= -f2 | sed 's|^\./||' || echo "config"
}

# Return 0 if the file should be ignored given an ignore file's patterns.
# Basename patterns are matched against the filename; ^/ patterns against the
# relative path from the package root (with a leading /).
is_ignored() {
  local rel="$1" ignore_file="$2"
  [ -f "$ignore_file" ] || return 1
  local base="${rel##*/}"
  while IFS= read -r pat || [ -n "$pat" ]; do
    [ -z "$pat" ] && continue
    # Stow anchors patterns to the whole segment, so e.g. \.git matches the
    # .git dir exactly, not .gitconfig. Anchor to mirror that.
    if [[ "$pat" == ^/* ]]; then
      [[ "/$rel" =~ ${pat}$ ]] && return 0
    else
      [[ "$base" =~ ^(${pat})$ ]] && return 0
    fi
  done <"$ignore_file"
  return 1
}

@test "no two config packages resolve to the same stow target" {
  local dir targets
  dir="$(stow_dir)"
  targets="$BATS_TEST_TMPDIR/targets"
  global_ignore="$REPO/$dir/gnustow/.stow-global-ignore"

  for pkg in "$REPO/$dir/"/*/; do
    [ -d "$pkg" ] || continue
    local_ignore="${pkg}.stow-local-ignore"

    find "$pkg" -type f ! -name '.stow-local-ignore' | while IFS= read -r file; do
      rel="${file#"$pkg"}"

      is_ignored "$rel" "$global_ignore" && continue
      is_ignored "$rel" "$local_ignore" && continue

      # Simulate --dotfiles: any path component starting with dot- becomes .
      target=$(printf '%s' "$rel" | sed 's|/dot-|/.|g; s|^dot-|.|')
      printf '%s\t%s\n' "$target" "$file"
    done
  done >"$targets"

  dupes=$(cut -f1 "$targets" | sort | uniq -d)
  [ -z "$dupes" ] || {
    echo "Stow target conflicts detected:"
    while IFS= read -r t; do
      echo "  ~/$t"
      grep -F "$t	" "$targets" | cut -f2 | sed 's/^/    /'
    done <<<"$dupes"
    return 1
  }
}
