#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

# ┌─┐┌─┐┌┐┌┌─┐┬─┐┬┌─┐
# │ ┬├┤ │││├┤ ├┬┘││
# └─┘└─┘┘└┘└─┘┴└─┴└─┘

alias ,c="clear" # Clear the terminal
alias ,r="exec $SHELL -l" # Reload the shell
alias ,q="exit" # Quit the shell
alias ,s="pmset sleepnow" # Mac-specific sleep
alias ,i="ping 8.8.8.8" # Check internet connection
alias ,w="curl wttr.in/Melbourne,AU" # Check the weather
alias ,fp='f() { lsof -nP -iTCP:"$1" -sTCP:LISTEN };f' # Find a port number in use
alias ,lp="lsof -P -i TCP -s TCP:LISTEN" # List all port numbers in use
alias ,kp='f() { killport "$1" };f' # Kill a port number
alias ,l="curl ipinfo.io/json" # Get the public IP address
alias ,b="wallpaper set-solid-color $*" # Set a solid color wallpaper
alias ,a="open --background 'lungo:toggle'" # Toogle computer awake mode (Lungo)
alias ,h="history" # Show command history
alias ,hs="history | grep $* -i" # Search command history
alias ,cd="change_source_directory" # Change to source directory
alias ,ed="edit_source_directory" # Edit source directory
alias ,cb="cointop price --coin bitcoin --currency aud" # Check the price of Bitcoin
alias ,ce="cointop price --coin ethereum --currency aud" # Check the price of Ethereum
alias ,ske="ioreg -l -w 0 | perl -nle 'print $1 if /"kCGSSessionSecureInputPID"=(\d+)/' | uniq | xargs -I{} ps -p {} -o comm=" # https://github.com/koekeishiya/skhd/issues/48
alias ,tls='nvim "+Tmuxline" "+TmuxlineSnapshot! ~/.tmux/statusline-colors.conf" "+qa"' # Generate tmuxline colorscheme
alias ,ss="shasum -a 256 $* | cut -d ' ' -f 1" # Get SHA256 hash for downloaded file to verify integrity
alias ,gopath="add_gopath" # Add a new GOPATH

# ┌─┐ ┬ ┬┬┌─┐┬┌─  ┌─┐┌┬┐┬┌┬┐
# │─┼┐│ │││  ├┴┐  ├┤  │││ │
# └─┘└└─┘┴└─┘┴ ┴  └─┘─┴┘┴ ┴

alias ,e="$EDITOR" # https://github.com/neovim/neovim
alias ,ls="n -AHei" # https://github.com/jarun/nnn
alias ,dot="cd $DOTFILES_HOME && $EDITOR"

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

# ┌─┐┬┌─┐┬  ┌─┐┌┬┐
# ├┤ ││ ┬│  ├┤  │
# └  ┴└─┘┴─┘└─┘ ┴
# http://www.figlet.org

alias ,fls="fl_fonts"
alias ,fl="figlet -d ~/.figlet/ $*"
alias ,flh1a="figlet -d ~/.figlet/ -f DOS\ Rebel $*"
alias ,flh1b="figlet -d ~/.figlet/ -f ANSI\ Shadow $*"
alias ,flh1c="figlet -d ~/.figlet/ -f ANSI\ Regular $*"
alias ,flh1d="figlet -d ~/.figlet/ -f Block $*"
alias ,flh1e="figlet -d ~/.figlet/ -f Doom $*"
alias ,flh2a="figlet -d ~/.figlet/ -f halfiwi $*"
alias ,flh2b="figlet -d ~/.figlet/ -f Calvin\ S $*"
alias ,flh3="figlet -d ~/.figlet/ -f wideterm $*"

