#!/bin/bash

# Rotates the center of the bar: every update_freq seconds (set on the quote
# item in sketchybarrc) a fresh quote replaces the vitals bracket members for
# QUOTE_SECS, then the vitals return. The sleep keeps one phase cycle inside a
# single script run, so no state needs to be stored between invocations.

QUOTE_SECS="${QUOTE_SECS:-30}"

VITALS=(cpu memory disk network.down network.up)

vitals_args=()
for item in "${VITALS[@]}"; do
  vitals_args+=(--set "$item" drawing=off)
done
# Absolute path: sketchybar's launchd environment has a minimal PATH that
# does not include ~/.local/bin.
sketchybar "${vitals_args[@]}" \
  --set "$NAME" label="$("$HOME/.local/bin/quote" --plain)" drawing=on

sleep "$QUOTE_SECS"

vitals_args=()
for item in "${VITALS[@]}"; do
  vitals_args+=(--set "$item" drawing=on)
done
sketchybar --set "$NAME" drawing=off "${vitals_args[@]}"
