#!/bin/sh

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

sketchybar --set "$NAME" label="$FOCUSED_WORKSPACE"
