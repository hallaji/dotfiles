#!/bin/sh

get_symbol() {
  case $1 in
    1) echo "󰬺" ;;
    2) echo "󰬻" ;;
    3) echo "󰬼" ;;
    4) echo "󰬽" ;;
    5) echo "󰬾" ;;
    6) echo "󰬿" ;;
    7) echo "󰭀" ;;
    8) echo "󰭁" ;;
    9) echo "󰭂" ;;
    10) echo "󰿩" ;;
    *) echo "$1" ;;
  esac
}

FOCUSED=$(get_symbol $(aerospace list-workspaces --focused))
ACTIVE=$(get_symbol $(aerospace list-workspaces --monitor 1 --empty no --count))
TOTAL=$(get_symbol $(aerospace list-workspaces --all --count))
SEPARATOR="↞" # ↞↠

sketchybar --set "$NAME" label="$FOCUSED$SEPARATOR$TOTAL"
