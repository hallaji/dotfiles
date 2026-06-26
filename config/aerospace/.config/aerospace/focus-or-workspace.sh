#!/usr/bin/env bash
# Focus a window in the given direction. If there is no window in that
# direction (we are at the workspace edge), fall through to the adjacent
# workspace instead. Used by the h/l focus bindings in .aerospace.toml.
#
# Usage: focus-or-workspace.sh <left|right>

set -euo pipefail

dir="${1:?usage: focus-or-workspace.sh <left|right>}"

before="$(aerospace list-windows --focused --format '%{window-id}' 2>/dev/null || true)"

# Stay within the current workspace so the edge can be detected.
aerospace focus --boundaries workspace --boundaries-action stop "$dir" 2>/dev/null || true

after="$(aerospace list-windows --focused --format '%{window-id}' 2>/dev/null || true)"

# Focus didn't move -> we were at the edge -> switch workspace.
if [[ "$before" == "$after" ]]; then
  case "$dir" in
  left) aerospace workspace --no-stdin --wrap-around prev ;;
  right) aerospace workspace --no-stdin --wrap-around next ;;
  esac
fi
