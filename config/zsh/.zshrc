# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

source ~/.config/zsh/init.zsh
source ~/.config/zsh/completions.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/extensions.zsh
source ~/.config/zsh/functions.zsh

for tool in ~/.config/zsh/tools/*.zsh; do source "$tool"; done

source ~/.config/zsh/keybindings.zsh
source ~/.config/zsh/aliases.zsh
