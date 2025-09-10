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
alias ,a="open --background 'lungo:toggle'" # Toggle computer awake mode (Lungo)
alias ,ske="ioreg -l -w 0 | perl -nle 'print $1 if /"kCGSSessionSecureInputPID"=(\d+)/' | uniq | xargs -I{} ps -p {} -o comm=" # https://github.com/koekeishiya/skhd/issues/48
alias ,path="echo $PATH | tr ':' '\n'" # Display PATH environment variable

# ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
# ├─┤│└─┐ │ │ │├┬┘└┬┘
# ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴

alias ,h="history" # Show command history

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

alias ls="ls --color" # Enable colors for `ls` command
alias ,e="$EDITOR" # Edit current directory
alias ,z='cd "$(zoxide query -l | fzf)"' # Change directory using zoxide and fzf
alias ,ls="n -AHei" # NNN file manager https://github.com/jarun/nnn
alias ,gopath="add_gopath" # Add a new GOPATH


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
alias ,rga="gpgconf --kill gpg-agent" # Restart GPG agent
alias ,ryabai="yabai --restart-service" # Restart Yabai
alias ,rskhd="skhd --restart-service" # Restart Skhd

# ┌┬┐┌─┐┌─┐┌─┐┬  ┌─┐
#  │ │ ││ ┬│ ┬│  ├┤
#  ┴ └─┘└─┘└─┘┴─┘└─┘

alias ,tsb="toggle_sketchybar" # Toggle SketchyBar

# ┌┬┐┌─┐┌┬┐┌─┐┬┬  ┌─┐┌─┐
#  │││ │ │ ├┤ ││  ├┤ └─┐
# ─┴┘└─┘ ┴ └  ┴┴─┘└─┘└─┘

alias ,dot="cd $DOTFILES_HOME && $EDITOR" # Navigate to dotfiles and open editor
alias ,s="stow_dotfiles" # Stow all dotfiles configurations

# ┌─┐┬┌┬┐
# │ ┬│ │
# └─┘┴ ┴

alias ,groot="cd $(git rev-parse --show-toplevel)" # Change directory to the git repository root
alias ,gwho="git config user.name && git config user.email" # Show current git user name and email
alias ,gun="git config user.name $*" # Set git user name
alias ,gue="git config user.email $*" # Set git user email
alias ,gra="git commit --amend --reset-author" # Amend git commit and reset author

# ┌─┐┬┌┬┐┬ ┬┬ ┬┌┐   ┌─┐┬  ┬
# │ ┬│ │ ├─┤│ │├┴┐  │  │  │
# └─┘┴ ┴ ┴ ┴└─┘└─┘  └─┘┴─┘┴

alias ,ghb="gh browse" # Open a repository in browser
alias ,ghd="gh dash" # Open the dashboard for issues and pull requests
alias ,ghbr="gh branch" # Show branches information
alias ,ghp="gh eco" # Check a GitHub profile
alias ,ghi="gh inspire" # Show an inspiration
alias ,ghgi="gh gitignore" # Load gitignore files into a project
alias ,ghc="gh copilot" # GitHub command line copilot

# ┬┌─┐┌─┐┌─┐
# │├─┤├─┤└─┐
# ┴┴ ┴┴ ┴└─┘

alias ,awsi="aws sts get-caller-identity" # Get AWS caller identity
alias ,awsc="change_aws_profile" # Change AWS profile
alias ,awss="start_ec2_session" # Start EC2 session
alias ,gcpc="change_gcloud_config" # Change Google Cloud config

# ┌─┐┬─┐┌─┐┌┐┌┌┬┐┌─┐┌┬┐
# │ ┬├┬┘├─┤│││ │ ├┤  ││
# └─┘┴└─┴ ┴┘└┘ ┴ └─┘─┴┘
# https://www.granted.dev

alias assume=". assume" # Assume a role
alias ,gd="assume" # Assume a role
alias ,gdw="assume -c" # Open a web console to the role
alias ,gdc="assume -ar" # Open console using active role
[[ "$PROFILE" == "CLTRMP" ]] && alias ,gdp="granted sso populate --sso-region us-west-2 https://cultureamp.awsapps.com/start" # Populate SSO profiles (CLTRMP profile only)

# ┌─┐┬─┐┬┌┐┌┌┬┐┌─┐
# ├─┘├┬┘││││ │ └─┐
# ┴  ┴└─┴┘└┘ ┴ └─┘

alias ,fig="figlet_show" # Display text in a selected figlet font
alias ,qt="quote" # Display a random quote
