#!/bin/sh

sketchybar --set "$NAME" label="$(top -l 2 -n 0 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5"%" }')"
