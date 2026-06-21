#!/bin/sh

sketchybar --set "$NAME" label="$(top -l 2 -n 0 | awk '/^CPU/ { usage = $3 + $5 } END { printf "%.0f%%\n", usage }')"
