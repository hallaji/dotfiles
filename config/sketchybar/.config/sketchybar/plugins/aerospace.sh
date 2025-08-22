#!/bin/sh

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

case $FOCUSED_WORKSPACE in
    1) SYMBOL="󰬺" ;;
    2) SYMBOL="󰬻" ;;
    3) SYMBOL="󰬼" ;;
    4) SYMBOL="󰬽" ;;
    5) SYMBOL="󰬾" ;;
    6) SYMBOL="󰬿" ;;
    7) SYMBOL="󰭀" ;;
    8) SYMBOL="󰭁" ;;
    9) SYMBOL="󰭂" ;;
    *) SYMBOL="$FOCUSED_WORKSPACE" ;;
esac

sketchybar --set "$NAME" label="$SYMBOL"
