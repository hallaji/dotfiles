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
alias ,i="ping 8.8.8.8"
alias ,w="curl wttr.in/Melbourne,AU"
alias ,p='f() { lsof -nP -iTCP:"$1" -sTCP:LISTEN };f'
alias ,l="curl ipinfo.io/json"
alias ,b="wallpaper set-solid-color $*"

# ┌─┐ ┬ ┬┬┌─┐┬┌─  ┌─┐┌┬┐┬┌┬┐
# │─┼┐│ │││  ├┴┐  ├┤  │││ │
# └─┘└└─┘┴└─┘┴ ┴  └─┘─┴┘┴ ┴

alias ,dot="cd $DOTFILES && $EDITOR $DOTFILES"

# ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
# ├─┤│└─┐ │ │ │├┬┘└┬┘
# ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴

alias ,h="history"
alias ,hs="history | grep $* -i"

# ┌─┐┬┌┬┐
# │ ┬│ │
# └─┘┴ ┴

alias ,gwho='git config user.name && git config user.email'
alias ,gme='git config user.email <%= ENV["USER_EMAIL"] %> && ,gwho'
alias ,gca='git config user.email <%= ENV["USER_EMAIL_CLTRMP"] %> && ,gwho'
alias ,gra='git commit --amend --reset-author'

# ┌─┐┬┌─┐┬  ┌─┐┌┬┐
# ├┤ ││ ┬│  ├┤  │
# └  ┴└─┘┴─┘└─┘ ┴

alias ,fl="figlet -d ~/.figlet/ $*"
alias ,flh1="figlet -d ~/.figlet/ -f ANSI\ Shadow $*"
alias ,flh2="figlet -d ~/.figlet/ -f Calvin\ S $*" # bold version with `-f future`
alias ,flh3="figlet -d ~/.figlet/ -f wideterm $*"
