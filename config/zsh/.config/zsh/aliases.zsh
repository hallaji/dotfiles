#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

# ┌┬┐┌─┐┬─┐┌┬┐┬┌┐┌┌─┐┬
#  │ ├┤ ├┬┘│││││││├─┤│
#  ┴ └─┘┴└─┴ ┴┴┘└┘┴ ┴┴─┘

alias ,c="clear" # Clear the terminal
alias ,q="exit" # Quit the shell

# ┌─┐┬ ┬┌─┐┌┬┐┌─┐┌┬┐
# └─┐└┬┘└─┐ │ ├┤ │││
# └─┘ ┴ └─┘ ┴ └─┘┴ ┴

alias ,os="uname | tr '[:upper:]' '[:lower:]'" # OS name in lowercase letters
alias ,ss="shasum -a 256 $* | cut -d ' ' -f 1" # Get SHA256 hash for downloaded file to verify integrity
alias ,b="wallpaper set-solid-color $*" # Set a solid color wallpaper
alias ,a="open --background 'lungo:toggle'" # Toogle computer awake mode (Lungo)
alias ,ske="ioreg -l -w 0 | perl -nle 'print $1 if /"kCGSSessionSecureInputPID"=(\d+)/' | uniq | xargs -I{} ps -p {} -o comm=" # https://github.com/koekeishiya/skhd/issues/48

# ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
# ├─┤│└─┐ │ │ │├┬┘└┬┘
# ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴

alias ,h="history" # Show command history
alias ,hs="history | grep $* -i" # Search command history

# ┌┐┌┌─┐┌┬┐┬ ┬┌─┐┬─┐┬┌─
# │││├┤  │ ││││ │├┬┘├┴┐
# ┘└┘└─┘ ┴ └┴┘└─┘┴└─┴ ┴

alias ,i="ping 8.8.8.8" # Check internet connection
alias ,l="curl ipinfo.io/json" # Get the public IP address
alias ,w="curl wttr.in/Melbourne,AU" # Check the weather

# ┌─┐┌─┐┬─┐┌┬┐  ┌┬┐┌─┐┌┐┌┌─┐┌─┐┌─┐┌┬┐┌─┐┌┐┌┌┬┐
# ├─┘│ │├┬┘ │   │││├─┤│││├─┤│ ┬├┤ │││├┤ │││ │
# ┴  └─┘┴└─ ┴   ┴ ┴┴ ┴┘└┘┴ ┴└─┘└─┘┴ ┴└─┘┘└┘ ┴

alias ,fp='f() { lsof -nP -iTCP:"$1" -sTCP:LISTEN };f' # Find a port number in use
alias ,lp="lsof -P -i TCP -s TCP:LISTEN" # List all port numbers in use
alias ,kp='f() { killport "$1" };f' # Kill a port number

# ┌─┐┬┬  ┌─┐┌─┐
# ├┤ ││  ├┤ └─┐
# └  ┴┴─┘└─┘└─┘

alias ls="ls --color"
alias ,cd="change_source_directory" # Change to source directory
alias ,ed="edit_source_directory" # Edit source directory
alias ,gopath="add_gopath" # Add a new GOPATH
alias ,e="$EDITOR" # https://github.com/neovim/neovim
alias ,ls="n -AHei" # https://github.com/jarun/nnn

# ┌─┐┬─┐┬ ┬┌─┐┌┬┐┌─┐
# │  ├┬┘└┬┘├─┘ │ │ │
# └─┘┴└─ ┴ ┴   ┴ └─┘

alias ,cb="cointop price --coin bitcoin --currency aud" # Check the price of Bitcoin
alias ,ce="cointop price --coin ethereum --currency aud" # Check the price of Ethereum

# ┬─┐┌─┐┌─┐┌┬┐┌─┐┬─┐┌┬┐
# ├┬┘├┤ └─┐ │ ├─┤├┬┘ │
# ┴└─└─┘└─┘ ┴ ┴ ┴┴└─ ┴

alias ,r="exec $SHELL -l" # Reload the shell
alias ,rtl='nvim "+Tmuxline" "+TmuxlineSnapshot! ~/.tmux/statusline-colors.conf" "+qa"' # Generate tmuxline colorscheme
alias ,rga="gpgconf --kill gpg-agent"
alias ,ryabai="yabai --restart-service"
alias ,rskhd="skhd --restart-service"

# ┌┬┐┌─┐┌─┐┌─┐┬  ┌─┐
#  │ │ ││ ┬│ ┬│  ├┤
#  ┴ └─┘└─┘└─┘┴─┘└─┘

alias ,tsb="toggle_sketchybar"

# ┌┬┐┌─┐┌┬┐┌─┐┬┬  ┌─┐┌─┐
#  │││ │ │ ├┤ ││  ├┤ └─┐
# ─┴┘└─┘ ┴ └  ┴┴─┘└─┘└─┘

alias ,dot="cd $DOTFILES_HOME && $EDITOR"
alias ,f="fresh"
alias ,s="stow_dotfiles"

# ┌─┐┬┌┬┐
# │ ┬│ │
# └─┘┴ ┴

alias ,gwho="git config user.name && git config user.email"
alias ,gun="git config user.name $*"
alias ,gue="git config user.email $*"
alias ,gra="git commit --amend --reset-author"

# ┌─┐┬┌┬┐┬ ┬┬ ┬┌┐   ┌─┐┬  ┬
# │ ┬│ │ ├─┤│ │├┴┐  │  │  │
# └─┘┴ ┴ ┴ ┴└─┘└─┘  └─┘┴─┘┴

alias ,ghb="gh browse"
alias ,ghd="gh dash"
alias ,ghbr="gh branch"
alias ,ghp="gh eco"
alias ,ghi="gh inspire"
alias ,ghgi="gh gitignore"
alias ,ghc="gh copilot"

# ┌─┐┬ ┬┌─┐
# ├─┤│││└─┐
# ┴ ┴└┴┘└─┘

alias ,awsi="aws sts get-caller-identity"
alias ,awsc="change_aws_profile"
alias ,awss="start_ec2_session"

# ┌─┐┌─┐┌─┐
# │ ┬│  ├─┘
# └─┘└─┘┴

alias ,gcpc="change_gcloud_config"

# ┌─┐┬─┐┌─┐┌┐┌┌┬┐┌─┐┌┬┐
# │ ┬├┬┘├─┤│││ │ ├┤  ││
# └─┘┴└─┴ ┴┘└┘ ┴ └─┘─┴┘
# https://www.granted.dev

alias assume=". assume"
alias ,gd="assume" # Assume a role
alias ,gdw="assume -c" # Open a web console to the role
alias ,gdc="assume -ar" # Open console using active role
[[ "$PROFILE" == "CLTRMP" ]] && alias ,gdp="granted sso populate --sso-region us-west-2 https://cultureamp.awsapps.com/start" # Populate SSO profiles

# ┌─┐┬┌─┐┬  ┌─┐┌┬┐
# ├┤ ││ ┬│  ├┤  │
# └  ┴└─┘┴─┘└─┘ ┴
# http://www.figlet.org

alias ,fig="figlet -d ~/.figlet/ $*"
alias ,fig1a="figlet -d ~/.figlet/ -f ANSI\ Shadow $*"
alias ,fig1b="figlet -d ~/.figlet/ -f ANSI\ Regular $*"
alias ,fig1c="figlet -d ~/.figlet/ -f Block $*"
alias ,fig1d="figlet -d ~/.figlet/ -f Doom $*"
alias ,fig2a="figlet -d ~/.figlet/ -f halfiwi $*"
alias ,fig2b="figlet -d ~/.figlet/ -f Calvin\ S $*"
alias ,fig3="figlet -d ~/.figlet/ -f wideterm $*"
