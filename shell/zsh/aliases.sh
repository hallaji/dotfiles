
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
alias ,cd="change_source_directory"
alias ,ed="edit_source_directory"
alias ,cb="cointop price --coin bitcoin --currency aud"
alias ,ce="cointop price --coin ethereum --currency aud"
alias ,ske="ioreg -l -w 0 | perl -nle 'print $1 if /"kCGSSessionSecureInputPID"=(\d+)/' | uniq | xargs -I{} ps -p {} -o comm=" # https://github.com/koekeishiya/skhd/issues/48
alias ,tls='nvim "+Tmuxline" "+TmuxlineSnapshot! ~/.tmux/statusline-colors.conf" "+qa"'
alias ,ss="shasum -a 256 $* | cut -d ' ' -f 1" # Get SHA256 hash for downloaded file to verify integrity
alias ,gopath="add_gopath"

# ┌─┐ ┬ ┬┬┌─┐┬┌─  ┌─┐┌┬┐┬┌┬┐
# │─┼┐│ │││  ├┴┐  ├┤  │││ │
# └─┘└└─┘┴└─┘┴ ┴  └─┘─┴┘┴ ┴

alias ,e="$EDITOR" # https://github.com/neovim/neovim
alias ,ls="n -AHei" # https://github.com/jarun/nnn
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
alias ,ghi="gh inspire"
alias ,ghgi="gh gitignore"
alias ,ghc="gh copilot"

# ┌─┐┬┌─┐┬  ┌─┐┌┬┐
# ├┤ ││ ┬│  ├┤  │
# └  ┴└─┘┴─┘└─┘ ┴

# http://www.figlet.org

alias ,fl="figlet -d ~/.figlet/ $*"
alias ,flh1="figlet -d ~/.figlet/ -f ANSI\ Shadow $*"
alias ,flh2="figlet -d ~/.figlet/ -f Calvin\ S $*" # bold version with `-f future`
alias ,flh3="figlet -d ~/.figlet/ -f wideterm $*"

# ┌─┐┌─┐┬─┐┬  ┬┬┌─┐┌─┐┌─┐
# └─┐├┤ ├┬┘└┐┌┘││  ├┤ └─┐
# └─┘└─┘┴└─ └┘ ┴└─┘└─┘└─┘

alias ,aws=". assume" # https://www.granted.dev
alias ,awsi="aws sts get-caller-identity"
alias ,awsc="change_aws_profile"
alias ,gcpc="change_gcloud_config"
alias ,rga="gpgconf --kill gpg-agent"
alias ,ryabai="yabai --restart-service"
alias ,rskhd="skhd --restart-service"
