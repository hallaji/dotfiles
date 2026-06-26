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

echo " ${CURRENT_DIR##*/}  $GIT_BRANCH  $MODEL_DISPLAY"
