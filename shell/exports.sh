
# ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
# ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
# █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
# ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
# ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
# ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝

# ┌─┐┌─┐┌┐┌┌─┐┬─┐┬┌─┐
# │ ┬├┤ │││├┤ ├┬┘││
# └─┘└─┘┘└┘└─┘┴└─┴└─┘

export SHELL="/bin/zsh"
export LANG=en_AU.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export DOTFILES="$HOME/.dotfiles"
export CODE="$HOME/Code"

# ┌┬┐┌─┐┌─┐┌─┐┬ ┬┬ ┌┬┐  ┌─┐┌┬┐┬┌┬┐┌─┐┬─┐
#  ││├┤ ├┤ ├─┤│ ││  │   ├┤  │││ │ │ │├┬┘
# ─┴┘└─┘└  ┴ ┴└─┘┴─┘┴   └─┘─┴┘┴ ┴ └─┘┴└─

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ┌─┐┬┌┬┐┬ ┬┬ ┬┌┐
# │ ┬│ │ ├─┤│ │├┴┐
# └─┘┴ ┴ ┴ ┴└─┘└─┘
# https://github.com

export GITHUB_TOKEN=<%= ENV["GITHUB_TOKEN"] %>
export GITHUB_REGISTRY_TOKEN=<%= ENV["GITHUB_REGISTRY_TOKEN"] %>

# ┌┐┌┌┐┌┌┐┌
# │││││││││
# ┘└┘┘└┘┘└┘
# https://github.com/jarun/nnn
# https://github.com/jarun/nnn/tree/master/plugins

export NNN_PLUG="o:fzopen;f:fzcd;j:autojump;p:preview-tui;v:imgview"
export NNN_BMS="d:$DOTFILES"
export NNN_COLORS="4356" # Contexts: 1st, 2nd, 3rd, 4th
export NNN_FCOLORS="0e0b05040d060e0909030708" # BLK, CHR, DIR, EXE, REG, HARDLINK, SYMLINK, MISSING, ORPHAN, FIFO, SOCK, OTHER
export NNN_FIFO="/tmp/nnn.fifo"

# ┌─┐┬  ┌─┐┌─┐┬┌─
# └─┐│  ├─┤│  ├┴┐
# └─┘┴─┘┴ ┴└─┘┴ ┴

export SLACK_COLORS="#1A1D21,#3B3232,#FFC2C0,#1A1D21,#3B3232,#FFE9E8,#FFA95A,#00b196,#1A1D21,#FFC2C0"
