#!/bin/bash

source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/profile.zsh"

sketchybar --set "$NAME" label="$(display_hostname)"
