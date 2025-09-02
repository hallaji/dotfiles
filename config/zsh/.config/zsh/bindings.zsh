# ██████╗ ██╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
# ██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
# ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗███████╗
# ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║╚════██║
# ██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝███████║
# ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

# Vi Mode
bindkey -v

# Reduce the lag but also slow enough to press `vv`
export KEYTIMEOUT=20

# See functions.sh
zle -N edit_source_directory
zle -N change_source_directory
bindkey "^o" edit_source_directory
bindkey "^p" change_source_directory

# Navigate history
bindkey '^[[A' up-history
bindkey '^[[B' down-history

# History search (incremental)
bindkey '^r' history-incremental-search-backward
bindkey '^t' history-incremental-search-forward

# Emacs-style navigation
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^w' backward-kill-word
bindkey '^u' kill-whole-line

