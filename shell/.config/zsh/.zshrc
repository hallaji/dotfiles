
# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

ZSHRC_DIR="$(dirname "${(%):-%x}")"

source "$ZSHRC_DIR/scripts/init.zsh"
source "$ZSHRC_DIR/scripts/completions.zsh"
source "$ZSHRC_DIR/scripts/history.zsh"
source "$ZSHRC_DIR/scripts/extensions.zsh"
source "$ZSHRC_DIR/scripts/functions.zsh"

for tool in "$ZSHRC_DIR/tools"/*.zsh; do source "$tool"; done

source "$ZSHRC_DIR/scripts/keybindings.zsh"
source "$ZSHRC_DIR/scripts/aliases.zsh"
