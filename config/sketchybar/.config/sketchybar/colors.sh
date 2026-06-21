#!/bin/bash

# Shared color palette. Sourced by sketchybarrc and any plugin that needs to
# recolor items at runtime (e.g. aerospace.sh mode handling).
#
# Names mirror the dotfiles palette (config/env/.env.example) exactly. They're
# redeclared here rather than sourced from it because SketchyBar needs the
# 0xAARRGGBB form (alpha-prefixed), while the env file holds web #RRGGBB hex —
# and that env isn't guaranteed to be loaded in SketchyBar's runtime.

export TRANSPARENT=0x00000000      # no palette equivalent — bar background
export PALETTE_BA_PRIMARY_FG=0xffe1e4e8 # default label color
export PALETTE_SE_PRIMARY=0xff04f6f6    # default icon color, normal-mode border
export PALETTE_SE_ERROR=0xffff4b82      # separators, move mode, network highlight
export PALETTE_SE_WARNING=0xfff5b168    # service mode
