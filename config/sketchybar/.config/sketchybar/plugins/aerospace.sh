#!/bin/sh

get_symbol() {
  case $1 in
    1) echo "󰬺" ;;
    2) echo "󰬻" ;;
    3) echo "󰬼" ;;
    4) echo "󰬽" ;;
    5) echo "󰬾" ;;
    6) echo "󰬿" ;;
    7) echo "󰭀" ;;
    8) echo "󰭁" ;;
    9) echo "󰭂" ;;
    0|10) echo "󰿩" ;;
    *) echo "󰿫" ;;
  esac
}

# Mode change (--trigger aerospace_mode_change MODE=<mode>). Handle this without
# any `aerospace` calls so it's instant: recolor the workspace label and toggle
# the mode glyph. Avoids the flash from slow/async full-label recomputes.
if [ "$SENDER" = "aerospace_mode_change" ]; then
  # Read the ACTUAL current mode rather than trusting the triggered MODE arg:
  # on fast enter/exit the move/main triggers run async and can land out of
  # order, which would leave the border stuck. `mode main`/`mode move` run
  # synchronously in the binding before the trigger, so this is authoritative.
  case "$(aerospace list-modes --current 2>/dev/null)" in
    move)    GLYPH="󰰏"; COLOR=0xfff47067; BORDER=0xfff47067; DRAWING=on ;;
    service) GLYPH="󰰡"; COLOR=0xfff5b168; BORDER=0xfff5b168; DRAWING=on ;;
    *)       GLYPH="";  COLOR=0xffffffff; BORDER=0xff04f6f6; DRAWING=off ;;
  esac

  # Recolor the focused-window border to mark the active mode (instant; talks to
  # the running borders daemon). Border reset color = borders' default active.
  borders active_color="$BORDER" 2>/dev/null
  sketchybar --set aerospace label.color="$COLOR" \
             --set window_count label.color="$COLOR" \
             --set mode_indicator drawing="$DRAWING" label="$GLYPH" label.color="$COLOR"
  exit 0
fi

# Workspace/refresh: rebuild the aerospace label and window count. Don't set
# label.color here so the active mode color (if any) is preserved across
# workspace changes.
FOCUSED=$(get_symbol "$(aerospace list-workspaces --focused)")
TOTAL=$(get_symbol "$(aerospace list-workspaces --all --count)")
WINDOWS=$(aerospace list-windows --workspace focused --count 2>/dev/null)
SEPARATOR="↠" # ↞↠

sketchybar --set aerospace label="$FOCUSED$SEPARATOR$TOTAL" \
           --set window_count label="${WINDOWS:-0}"
