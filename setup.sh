#!/usr/bin/env bash
# ███████╗███████╗████████╗██╗   ██╗██████╗
# ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
# ███████╗█████╗     ██║   ██║   ██║██████╔╝
# ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝
# ███████║███████╗   ██║   ╚██████╔╝██║
# ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝

set -e


cat <<-MESSAGE
┌─┐┌─┐┌┬┐┌─┐
├─┤└─┐ ││├┤
┴ ┴└─┘─┴┘└
MESSAGE
# @see https://github.com/asdf-vm/asdf
ASDF_DIR=~/.asdf
if [[ -s "$ASDF_DIR/asdf.sh" ]]; then
  source "$ASDF_DIR/asdf.sh" && asdf update
else
  git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR"
  cd "$ASDF_DIR"
  git checkout "$(git describe --abbrev=0 --tags)"
fi


cat <<-MESSAGE
┌─┐┌┬┐┬┌─┌┬┐┌─┐┌┐┌
└─┐ ││├┴┐│││├─┤│││
└─┘─┴┘┴ ┴┴ ┴┴ ┴┘└┘
MESSAGE
# @see https://github.com/sdkman/sdkman-cli
SDKMAN_DIR=~/.sdkman
if [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
  sed -i '' 's/sdkman_auto_complete=true/sdkman_auto_complete=false/g' "$SDKMAN_DIR/etc/config"
  source "$SDKMAN_DIR/bin/sdkman-init.sh" && sdk selfupdate force
else
  curl -s "https://get.sdkman.io" | bash
fi


cat <<-MESSAGE
┌─┐┬─┐┌─┐┌─┐┬ ┬
├┤ ├┬┘├┤ └─┐├─┤
└  ┴└─└─┘└─┘┴ ┴
MESSAGE
# @see https://github.com/freshshell/fresh
FRESH_LOCAL_SOURCE=hallaji/dotfiles bash -c "`curl -sL https://get.freshshell.com`"


echo "\nDone. Reload your terminal."
