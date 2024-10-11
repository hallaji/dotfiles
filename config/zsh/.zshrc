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
source ~/.config/zsh/quotes.zsh

# Order of the source matters
source ~/.config/zsh/tools/1password.zsh
source ~/.config/zsh/tools/direnv.zsh
source ~/.config/zsh/tools/fresh.zsh
source ~/.config/zsh/tools/gcloud.zsh
source ~/.config/zsh/tools/homebrew.zsh
source ~/.config/zsh/tools/icu4c.zsh
source ~/.config/zsh/tools/jenv.zsh
source ~/.config/zsh/tools/jump.zsh
source ~/.config/zsh/tools/nnn.zsh
source ~/.config/zsh/tools/pnpm.zsh
source ~/.config/zsh/tools/pyenv.zsh

# Ensure ASDF path export is after homebrew to take precedence over installed binaries
source ~/.config/zsh/tools/asdf.zsh
source ~/.config/zsh/tools/starship.zsh

source ~/.config/zsh/keybindings.zsh
source ~/.config/zsh/aliases.zsh
