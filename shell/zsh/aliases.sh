
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
alias ,s="pmset sleepnow" # Mac-specific sleep
alias ,i="ping 8.8.8.8"
alias ,w="curl wttr.in/Melbourne,AU"
alias ,fp='f() { lsof -nP -iTCP:"$1" -sTCP:LISTEN };f' # Find a port number in use
alias ,lp="lsof -P -i TCP -s TCP:LISTEN" # List all port numbers in use
alias ,kp='f() { killport "$1" };f' # Kill a port number
alias ,l="curl ipinfo.io/json"
alias ,b="wallpaper set-solid-color $*"
alias ,a="open --background 'lungo:toggle'" # Toogle computer awake mode (Lungo)
alias ,h="history"
alias ,hs="history | grep $* -i"
alias ,cd="change_source_directory" # @see shell/functions.sh
alias ,ed="edit_source_directory" # @see shell/functions.sh
alias ,aws="change_aws_profile" # @see shell/functions.sh
alias ,gcp="change_gcloud_config" # @see shell/functions.sh
alias ,cb="cointop price --coin bitcoin --currency aud"
alias ,ce="cointop price --coin ethereum --currency aud"
alias ,ske="ioreg -l -w 0 | perl -nle 'print $1 if /"kCGSSessionSecureInputPID"=(\d+)/' | uniq | xargs -I{} ps -p {} -o comm=" # https://github.com/koekeishiya/skhd/issues/48
alias ,rga="gpgconf --kill gpg-agent" # Restart the GPG Agent

# ┌─┐ ┬ ┬┬┌─┐┬┌─  ┌─┐┌┬┐┬┌┬┐
# │─┼┐│ │││  ├┴┐  ├┤  │││ │
# └─┘└└─┘┴└─┘┴ ┴  └─┘─┴┘┴ ┴

alias ,e="$EDITOR" # https://github.com/neovim/neovim
alias ,ls="n -Aeoi" # https://github.com/jarun/nnn
alias ,dot="cd $DOTFILES && $EDITOR"

# ┌─┐┬┌┬┐
# │ ┬│ │
# └─┘┴ ┴

# https://git-scm.com

alias ,gwho="git config user.name && git config user.email"
alias ,gun="git config user.name $*"
alias ,gue="git config user.email $*"
alias ,gra="git commit --amend --reset-author"

# ┌─┐┬┌┬┐┬ ┬┬ ┬┌┐   ┌─┐┬  ┬
# │ ┬│ │ ├─┤│ │├┴┐  │  │  │
# └─┘┴ ┴ ┴ ┴└─┘└─┘  └─┘┴─┘┴

# https://cli.github.com

alias ,ghb="gh browse"
alias ,ghd="gh dash"
alias ,ghp="gh eco"
alias ,ghbr="gh branch"
alias ,ghie="gh inspire"
alias ,ghgi="gh gitignore"

# ┌─┐┬┌─┐┬  ┌─┐┌┬┐
# ├┤ ││ ┬│  ├┤  │
# └  ┴└─┘┴─┘└─┘ ┴

# http://www.figlet.org

alias ,fl="figlet -d ~/.figlet/ $*"
alias ,flh1="figlet -d ~/.figlet/ -f ANSI\ Shadow $*"
alias ,flh2="figlet -d ~/.figlet/ -f Calvin\ S $*" # bold version with `-f future`
alias ,flh3="figlet -d ~/.figlet/ -f wideterm $*"

# ┌─┐┬─┐┌─┐┌┐┌┌┬┐┌─┐┌┬┐
# │ ┬├┬┘├─┤│││ │ ├┤  ││
# └─┘┴└─┴ ┴┘└┘ ┴ └─┘─┴┘

# https://www.granted.dev

alias assume=". assume"