#!/bin/sh

HOSTNAME=$(hostname | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')
case "$(hostname)" in
  vhallaji-41NW96)
    export HOSTNAME="Monomaran"
    ;;
esac

sketchybar --set "$NAME" label="$HOSTNAME"
