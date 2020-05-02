# ██╗   ██╗██╗      ███╗   ███╗ ██████╗ ██████╗ ███████╗
# ██║   ██║██║      ████╗ ████║██╔═══██╗██╔══██╗██╔════╝
# ██║   ██║██║█████╗██╔████╔██║██║   ██║██║  ██║█████╗
# ╚██╗ ██╔╝██║╚════╝██║╚██╔╝██║██║   ██║██║  ██║██╔══╝
#  ╚████╔╝ ██║      ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████╗
#   ╚═══╝  ╚═╝      ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝

# Vi Mode
bindkey -v

# kill the lag
export KEYTIMEOUT=1

# see quick_find in function.sh
zle -N quick_find_widget find_source
bindkey "^p" quick_find_widget

# allow v to edit the command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# navigate history
bindkey '^k' up-history
bindkey '^j' down-history

# better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# backspace and ^h working even after returning from command mode
bindkey '^h' backward-delete-char

# ctrl-w removes a word backward
bindkey '^w' backward-kill-word

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
