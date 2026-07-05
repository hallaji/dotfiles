#!/usr/bin/env bash

# Render docs/assets/*.svg.template into the committed .svg mockups embedded
# by docs/PALETTE.md. Colors come from the palette in config/env/.env, parsed
# from the file itself (not the caller's environment) so output is
# deterministic in CI and sandboxes. Run via `devbox run palette-assets`
# whenever the palette or a mockup template changes;
# tests/unit/palette-sync.bats fails when the committed .svg files are stale.
#
# Usage: render-palette-assets.sh [outdir]   (default: docs/assets)
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

outdir="${1:-docs/assets}"
mkdir -p "$outdir"

# Define and export the palette (both layers; aliases resolve in file order).
eval "$(grep -E '^export PALETTE_' config/env/.env)"

for tpl in docs/assets/*.svg.template; do
  out="$outdir/$(basename "${tpl%.template}")"
  if type envsubst >/dev/null 2>&1; then
    envsubst <"$tpl" >"$out"
  else
    awk '{
      while(match($0, /\$\{[^}]+\}/)) {
        var = substr($0, RSTART+2, RLENGTH-3)
        val = ENVIRON[var]
        $0 = substr($0, 1, RSTART-1) val substr($0, RSTART+RLENGTH)
      }
      print
    }' "$tpl" >"$out"
  fi
done
