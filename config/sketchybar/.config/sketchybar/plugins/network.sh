#!/bin/sh

INTERFACE=$(route get default | grep interface | awk '{print $2}')
UPDOWN=$(ifstat -i "$INTERFACE" -b 0.1 1 | tail -n1)
DOWN=$(echo "$UPDOWN" | awk '{ print $1 }' | cut -f1 -d ".")
UP=$(echo "$UPDOWN" | awk '{ print $2 }' | cut -f1 -d ".")

format_speed() {
  if [ "$1" -gt 999 ]; then
    echo "$1" | awk '{ printf "%03.0f Mbps", $1 / 1000 }'
  else
    echo "$1" | awk '{ printf "%03.0f kbps", $1 }'
  fi
}

highlight() { [ "$1" -gt 0 ] && echo "on" || echo "off"; }

DOWN_FORMAT=$(format_speed "$DOWN")
UP_FORMAT=$(format_speed "$UP")

sketchybar --set network.down label="$DOWN_FORMAT" icon.highlight="$(highlight "$DOWN")" \
  --set network.up label="$UP_FORMAT" icon.highlight="$(highlight "$UP")"
