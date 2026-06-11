#!/bin/sh

sketchybar -m --set "$NAME" label="$(df -H | grep '/System/Volumes/Data$' | awk '{ printf ("%s\n", $5) }')"
