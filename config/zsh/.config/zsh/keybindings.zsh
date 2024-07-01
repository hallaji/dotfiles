# ██╗   ██╗██╗      ███╗   ███╗ ██████╗ ██████╗ ███████╗
# ██║   ██║██║      ████╗ ████║██╔═══██╗██╔══██╗██╔════╝
# ██║   ██║██║█████╗██╔████╔██║██║   ██║██║  ██║█████╗
# ╚██╗ ██╔╝██║╚════╝██║╚██╔╝██║██║   ██║██║  ██║██╔══╝
#  ╚████╔╝ ██║      ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████╗
#   ╚═══╝  ╚═╝      ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
# https://zsh.fyi/
# https://zsh.fyi/meta/zle
# https://zsh.fyi/zsh-line-editor#zle-builtins

# Vi Mode
bindkey -v

# Reduce the lag but also slow enough to press `vv`
export KEYTIMEOUT=20

# @see shell/function.sh
zle -N edit_source_directory
bindkey "^o" edit_source_directory

# @see shell/function.sh
zle -N change_source_directory
bindkey "^p" change_source_directory

# Navigate history
bindkey '^k' up-history
bindkey '^j' down-history
