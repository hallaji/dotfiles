#!/bin/sh

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  # Some output devices (external interfaces/DACs) don't expose software volume
  # control; macOS then reports a bogus 0. AppleScript returns "missing value"
  # for those, so use it to hide the indicator instead of showing a fake 0%.
  if [ "$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)" = "missing value" ]; then
    sketchybar --set "$NAME" drawing=off
    exit 0
  fi

  case "$VOLUME" in
    [6-9][0-9]|100) ICON=""
    ;;
    [3-5][0-9]) ICON=""
    ;;
    [1-9]|[1-2][0-9]) ICON=""
    ;;
    *) ICON=""
  esac

  sketchybar --set "$NAME" drawing=on icon="$ICON" label="$VOLUME%"
fi
