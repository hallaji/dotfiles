#!/bin/sh

sketchybar --set "$NAME" label="$(date '+%l:%M%p' | sed 's/^ *//' | tr '[:upper:]' '[:lower:]')"
