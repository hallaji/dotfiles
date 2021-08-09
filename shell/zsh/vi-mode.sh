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
zle -N quick_edit_widget edit_source
bindkey "^p" quick_edit_widget

# @see shell/function.sh
zle -N quick_change_widget change_source
bindkey "^o" quick_change_widget

# Navigate history
bindkey '^k' up-history
bindkey '^j' down-history
