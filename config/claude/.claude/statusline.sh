#!/bin/bash

input=$(cat)

CURRENT_DIR=$(echo "$input" | jq -r '.workspace.current_dir')
PROJECT_DIR=$(echo "$input" | jq -r '.workspace.project_dir')
MODEL_DISPLAY=$(echo "$input" | jq -r '.model.display_name')

GIT_BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
  BRANCH=$(git branch --show-current 2>/dev/null)
  if [ -n "$BRANCH" ]; then
    GIT_BRANCH="   $BRANCH"
  fi
fi

echo " ${CURRENT_DIR##*/}$GIT_BRANCH"
echo " $MODEL_DISPLAY"
