# ███████╗██╗███╗   ██╗██╗████████╗
# ╚══███╔╝██║████╗  ██║██║╚══██╔══╝
#   ███╔╝ ██║██╔██╗ ██║██║   ██║
#  ███╔╝  ██║██║╚██╗██║██║   ██║
# ███████╗██║██║ ╚████║██║   ██║
# ╚══════╝╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝

# Source above compinit i.e. initialising completion for the current session
export ZINIT_DIR="$HOME/.zinit/bin"
source "$ZINIT_DIR/zinit.zsh"

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/nvm/nvm.plugin.zsh
zinit snippet OMZ::plugins/npm/npm.plugin.zsh
zinit snippet OMZ::plugins/yarn/yarn.plugin.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# @TODO: completion for docker
