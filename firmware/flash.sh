#!/bin/bash

set -e

flash () {
  SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
  WORKING_DIR="/qmk_firmware"

  BUILD_DIR=".build"
  KEYBOARDS_DIR="keyboards"

  KEYMAP="$WORKING_DIR/$KEYBOARDS_DIR/$1/keymaps/$2/keymap.c"
  BUILD="$WORKING_DIR/$BUILD_DIR"

  mkdir -p "$SCRIPT_DIR$BUILD"

  docker run --rm -it \
    -w "$WORKING_DIR" \
    -v "$SCRIPT_DIR$KEYMAP:$KEYMAP" \
    -v "$SCRIPT_DIR$BUILD:$BUILD" \
    qmkfm/qmk_firmware \
    make "$1:$2"

  sleep 1
  dfu-programmer atmega32u4 erase --force
  dfu-programmer atmega32u4 flash "$SCRIPT_DIR$BUILD/$1_$2.hex"
  dfu-programmer atmega32u4 reset

  sleep 1
  rm -rf "$SCRIPT_DIR$BUILD"

  echo "Done! $1 keyboard is ready for $2."
}

flash "dz60" "hallaji"
