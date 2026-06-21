#!/bin/sh

BATT=$(pmset -g batt)
PERCENTAGE=$(echo "$BATT" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATT" | grep 'AC Power')

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON=""
  ;;
  [6-8][0-9]) ICON=""
  ;;
  [3-5][0-9]) ICON=""
  ;;
  [1-2][0-9]) ICON=""
  ;;
  *) ICON=""
esac

if [ "$CHARGING" != "" ]; then
  ICON=""
fi

TIME=$(echo "$BATT" | grep "discharging" | grep -Eo "[0-9]+:[0-9]+ remaining" | cut -d' ' -f1)
LABEL="${PERCENTAGE}%${TIME:+ $TIME}"

sketchybar --set "$NAME" icon="$ICON" label="$LABEL"
