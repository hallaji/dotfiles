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
alias ,r="exec $SHELL -l"
alias ,q="exit"
alias ,s="pmset sleepnow" # mac-specific
alias internet\?="ping 8.8.8.8"
alias weather="curl wttr.in/Melbourne,AU"

# ┌─┐ ┬ ┬┬┌─┐┬┌─  ┌─┐┌┬┐┬┌┬┐
# │─┼┐│ │││  ├┴┐  ├┤  │││ │
# └─┘└└─┘┴└─┘┴ ┴  └─┘─┴┘┴ ┴

# @see shell/functions.sh
alias ,f=find_source
alias ,d=change_source
alias ,e=edit_source
alias ,ed="cd $DOTFILES && $EDITOR $DOTFILES"

# ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
# ├─┤│└─┐ │ │ │├┬┘└┬┘
# ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴

alias ,h="history"
alias ,hs="history | grep $* -i"

# ┌─┐┬┌┬┐
# │ ┬│ │
# └─┘┴ ┴

alias ,gw='git config user.name && git config user.email'
alias ,gme='git config user.email <%= ENV["USER_EMAIL"] %>'
alias ,gco='git config user.email <%= ENV["CORPORATE_USER_EMAIL"] %>'

# ┌─┐┬┌─┐┬  ┌─┐┌┬┐
# ├┤ ││ ┬│  ├┤  │
# └  ┴└─┘┴─┘└─┘ ┴

alias fl="figlet -d ~/.figlet/ $*"
alias flh1="figlet -d ~/.figlet/ -f ANSI\ Shadow $*"
alias flh2="figlet -d ~/.figlet/ -f Calvin\ S $*" # bold version with `-f future`
alias flh3="figlet -d ~/.figlet/ -f wideterm $*"
