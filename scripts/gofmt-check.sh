#!/usr/bin/env bash

# Fail if any Go file passed as an argument is not gofmt-formatted.
# gofmt -l only lists offenders (exit 0 either way), so turn a non-empty list
# into a non-zero exit for pre-commit. Run via devbox so gofmt is on PATH.
set -euo pipefail

unformatted=$(gofmt -l "$@")
if [ -n "$unformatted" ]; then
  echo "These Go files are not gofmt-formatted:" >&2
  echo "$unformatted" >&2
  echo "Run 'devbox run fmt' to fix." >&2
  exit 1
fi
