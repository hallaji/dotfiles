#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

# ┌─┐┌─┐┌┐┌┌─┐┬─┐┬┌─┐
# │ ┬├┤ │││├┤ ├┬┘││
# └─┘└─┘┘└┘└─┘┴└─┴└─┘

alias ,c="clear"
alias ,r="source $HOME/.zshrc && source $HOME/.zshenv && clear"
alias internet\?="ping 8.8.8.8"
alias sleep="pmset sleepnow" # mac-specific

# ┌─┐ ┬ ┬┬┌─┐┬┌─  ┌─┐┌┬┐┬┌┬┐
# │─┼┐│ │││  ├┴┐  ├┤  │││ │
# └─┘└└─┘┴└─┘┴ ┴  └─┘─┴┘┴ ┴

alias c=open_source_code # check out functions.sh
alias ,ez="$EDITOR ~/.zshrc"
alias ,eze="$EDITOR ~/.zshenv"

# ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
# ├─┤│└─┐ │ │ │├┬┘└┬┘
# ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴

alias h='history'
alias hsi='history | grep $* -i'

# ┌─┐┬┌┬┐
# │ ┬│ │
# └─┘┴ ┴

alias gitwho="git config user.name && git config user.email"
alias gitme="git config user.email vahid@hallaji.com"
alias gitbueno="git config user.email vhallaji@buenosystems.com.au"

alias dotfile="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias tdf="dotfile config --local status.showUntrackedFiles normal"
alias utdf="dotfile config --local status.showUntrackedFiles no"
