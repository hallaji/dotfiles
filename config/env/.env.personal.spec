# ┌─┐┌─┐┬─┐┌─┐┌─┐┌┐┌┌─┐┬    ┌─┐┌─┐┌─┐┌─┐
# ├─┘├┤ ├┬┘└─┐│ ││││├─┤│    └─┐├─┘├┤ │
# ┴  └─┘┴└─└─┘└─┘┘└┘┴ ┴┴─┘  └─┘┴  └─┘└─┘
#
# Single source of truth for the personal env vars, shared by:
#   - config/bin/.local/bin/dotup-personal  (prompts for & writes these)
#   - tools/doctor/personal.go              (reports which are set)
#
# One entry per line: NAME, or NAME:secret. Secrets are reported set/missing by
# the doctor and never printed. Read from the repo by both consumers, so it works
# before stow runs and outside a login shell. Keep the entries alphabetical
# (LC_ALL=C); both consumers process them in file order.

GITHUB_ACCESS_TOKEN:secret
GITHUB_REGISTRY_TOKEN:secret
GITHUB_USER
GIT_USER_EMAIL
GIT_USER_NAME
OP_SERVICE_ACCOUNT_TOKEN:secret
SIGNING_KEY_SSH
# SIGNING_KEY_GPG
