#!/usr/bin/env bash
# Move the focused window toward the given direction:
#   1. If it can move within the workspace, it moves one step toward the edge.
#   2. If it's blocked at the edge but is NOT yet a full-height column (a window
#      sits above or below it), it is pulled out to become the full-height edge
#      column.
#   3. Only when it is already a full-height column at that edge does it cross to
#      the adjacent workspace.
# So a full-width/stacked window reaches the edge on the first command and
# crosses on the second. Mirror of focus-or-workspace.sh for the move bindings.
#
# AeroSpace exposes no window geometry, so "full height" is inferred by probing
# whether focus can leave the window vertically; focus is restored by window-id
# right after, so the probe moves no windows.
#
# Usage: move-or-workspace.sh <left|right>

set -euo pipefail

dir="${1:?usage: move-or-workspace.sh <left|right>}"
wid="$(aerospace list-windows --focused --format '%{window-id}' 2>/dev/null || true)"

# 1) Normal move within the workspace (swap toward the edge).
if aerospace move --boundaries workspace --boundaries-action fail "$dir" 2>/dev/null; then
  exit 0
fi

# 2) Blocked at the horizontal edge. It's a full-height column only when there
#    is no window above or below it.
has_vertical_neighbor() {
  local d cur
  for d in down up; do
    aerospace focus --boundaries workspace --boundaries-action stop "$d" 2>/dev/null || true
    cur="$(aerospace list-windows --focused --format '%{window-id}' 2>/dev/null || true)"
    if [ -n "$cur" ] && [ "$cur" != "$wid" ]; then
      aerospace focus --window-id "$wid" 2>/dev/null || true # restore focus
      return 0
    fi
  done
  return 1
}

if has_vertical_neighbor; then
  # Not full height yet: pull the window out to become the full-height edge column.
  aerospace move --boundaries workspace --boundaries-action create-implicit-container "$dir"
  exit 0
fi

# 3) Already a full-height column at the edge -> move it to the adjacent workspace.
case "$dir" in
left)
  aerospace move-node-to-workspace --no-stdin --focus-follows-window --wrap-around prev
  ;;
right)
  aerospace move-node-to-workspace --no-stdin --focus-follows-window --wrap-around next
  # Appended as last; push to the left end so it lands first in the next workspace.
  while aerospace move --boundaries workspace --boundaries-action fail left 2>/dev/null; do :; done
  ;;
esac
