#!/bin/sh

HOSTNAME=$(hostname | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')
case "$(hostname | tr '[:upper:]' '[:lower:]')" in
  vhallaji-41nw96)
    export HOSTNAME="Monomaran"
    ;;
  catamaran.local)
    export HOSTNAME="Catamaran"
    ;;
esac

sketchybar --set "$NAME" label="$HOSTNAME"
