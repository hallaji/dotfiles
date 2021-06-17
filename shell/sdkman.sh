
# ███████╗██████╗ ██╗  ██╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔══██╗██║ ██╔╝████╗ ████║██╔══██╗████╗  ██║
# ███████╗██║  ██║█████╔╝ ██╔████╔██║███████║██╔██╗ ██║
# ╚════██║██║  ██║██╔═██╗ ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ███████║██████╔╝██║  ██╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
# ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

# @see https://sdkman.io
# @see https://github.com/sdkman/sdkman-cli

export SDKMAN_DIR="$HOME/.sdkman"
export SDKMAN_CONFIG_DIR="$SDKMAN_DIR/etc/config"

if [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
  # use `-i .backup` to back up the original file
  sed -i '' 's/sdkman_auto_complete=false/sdkman_auto_complete=true/g' "$SDKMAN_CONFIG_DIR"
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi
