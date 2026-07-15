#!/bin/bash

input=$(cat)

# Parse all fields in one jq pass; @tsv turns missing/null fields into empty strings
IFS=$'\t' read -r CURRENT_DIR MODEL_DISPLAY < <(
  jq -r '[.workspace.current_dir, .model.display_name] | @tsv' <<<"$input"
)

# Resolve the branch in the directory we're displaying, not the script's cwd
if git -C "$CURRENT_DIR" rev-parse --git-dir >/dev/null 2>&1; then
  BRANCH=$(git -C "$CURRENT_DIR" branch --show-current 2>/dev/null)
  GIT_BRANCH="${BRANCH:-detached}"
else
  GIT_BRANCH="No branch"
fi

# Today's spend across all sessions. ccusage prices the raw transcript tokens
# (the transcripts carry no cost field of their own), but spawning it takes
# seconds, so we render a cached value and refresh it out of band.
cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/dotfiles"
cache="$cache_dir/cc-cost-today"
today=$(date +%Y%m%d)

COST=""
if [[ -f "$cache" ]]; then
  IFS=$'\t' read -r cached_day cached_cost <"$cache"
  [[ "$cached_day" == "$today" ]] && COST="$cached_cost"
fi

# Refresh at most once a minute, detached so a render never waits on npx. The
# stamp throttles retries even when ccusage is absent or fails.
if command -v npx >/dev/null 2>&1 && [[ -z "$(find "$cache.stamp" -mmin -1 2>/dev/null)" ]]; then
  # shellcheck disable=SC2016 # $CACHE/$TODAY expand in the child shell, not here
  CACHE_DIR="$cache_dir" CACHE="$cache" TODAY="$today" nohup bash -c '
    mkdir -p "$CACHE_DIR"
    touch "$CACHE.stamp"
    total=$(npx -y ccusage@latest daily --json --offline --since "$TODAY" 2>/dev/null |
      jq -r ".totals.totalCost // empty" 2>/dev/null)
    [ -n "$total" ] && printf "%s\t%.2f\n" "$TODAY" "$total" >"$CACHE"
  ' >/dev/null 2>&1 &
  disown 2>/dev/null
fi

COST_SEGMENT=""
[[ -n "$COST" ]] && COST_SEGMENT="\$$COST today"

echo " ${CURRENT_DIR##*/}   $GIT_BRANCH    $MODEL_DISPLAY   $COST_SEGMENT"
