# ██╗   ██╗██╗      ███╗   ███╗ ██████╗ ██████╗ ███████╗
# ██║   ██║██║      ████╗ ████║██╔═══██╗██╔══██╗██╔════╝
# ██║   ██║██║█████╗██╔████╔██║██║   ██║██║  ██║█████╗
# ╚██╗ ██╔╝██║╚════╝██║╚██╔╝██║██║   ██║██║  ██║██╔══╝
#  ╚████╔╝ ██║      ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████╗
#   ╚═══╝  ╚═╝      ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝

# Vi Mode
bindkey -v

# Reduce the lag but also slow enough to press `vv`
export KEYTIMEOUT=20

# @see shell/function.sh
zle -N edit_source_directory_widget edit_source_directory
bindkey "^p" edit_source_directory_widget

# @see shell/function.sh
zle -N change_source_directory_widget change_source_directory
bindkey "^o" change_source_directory_widget

# Navigate history
bindkey '^k' up-history
bindkey '^j' down-history
