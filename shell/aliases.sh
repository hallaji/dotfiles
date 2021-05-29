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
alias ,q="exit"
alias ,s="pmset sleepnow" # mac-specific
alias internet\?="ping 8.8.8.8"
alias weather="curl wttr.in/Melbourne,AU"

# ┌─┐ ┬ ┬┬┌─┐┬┌─  ┌─┐┌┬┐┬┌┬┐
# │─┼┐│ │││  ├┴┐  ├┤  │││ │
# └─┘└└─┘┴└─┘┴ ┴  └─┘─┴┘┴ ┴

# see functions.sh
alias ,f=find_source
alias ,d=change_source
alias ,e=edit_source
alias ,ed="cd $DOTFILES && $EDITOR $DOTFILES"

# ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
# ├─┤│└─┐ │ │ │├┬┘└┬┘
# ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴

alias ,h='history'
alias ,hs='history | grep $* -i'

# ┌─┐┬┌┬┐
# │ ┬│ │
# └─┘┴ ┴

alias gitwho="git config user.name && git config user.email"
alias gitme="git config user.email vahid@hallaji.com"
alias gitbueno="git config user.email vhallaji@buenosystems.com.au"

alias dotfile="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias tdf="dotfile config --local status.showUntrackedFiles normal"
alias utdf="dotfile config --local status.showUntrackedFiles no"
