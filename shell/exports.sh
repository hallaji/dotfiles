
# ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
# ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
# █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
# ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
# ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
# ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝

# ┌─┐┌─┐┌┐┌┌─┐┬─┐┬┌─┐
# │ ┬├┤ │││├┤ ├┬┘││
# └─┘└─┘┘└┘└─┘┴└─┴└─┘

# for formulae that put executables in /usr/local/sbin - homebrew
export PATH="/usr/local/sbin:$PATH"

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
export NNN_COLORS="4444"
export NNN_FCOLORS="000005000000000000000000"
export NNN_FIFO="/tmp/nnn.fifo"
