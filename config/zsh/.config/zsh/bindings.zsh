# ██████╗ ██╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
# ██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
# ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗███████╗
# ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║╚════██║
# ██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝███████║
# ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

export KEYTIMEOUT=20 # Reduce the lag but also slow enough to press `vv`

zle -N edit_source_directory
zle -N change_source_directory

# Vi mode
bindkey -v

# Change or edit directory
bindkey "^O" edit_source_directory
bindkey "^P" change_source_directory

# History search
bindkey "^R" history-search-multi-word
bindkey '^T' history-search-backward
bindkey '^Y' history-search-forward
bindkey '^[[A' up-history
bindkey '^[[B' down-history

# Navigation
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^W' backward-kill-word
bindkey '^U' kill-whole-line
