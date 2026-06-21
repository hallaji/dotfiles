#!/bin/sh

sketchybar --set "$NAME" label="$(date '+%-I:%M%p' | tr '[:upper:]' '[:lower:]')"
