#!/bin/sh

sketchybar --set "$NAME" label="$(memory_pressure | awk '/System-wide memory free percentage:/ { printf "%02.0f%%\n", 100-$5 }')"
