
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

export DOTFILES="~/.dotfiles"
export CODE="~/Code"

# ┌┬┐┌─┐┌─┐┌─┐┬ ┬┬ ┌┬┐  ┌─┐┌┬┐┬┌┬┐┌─┐┬─┐
#  ││├┤ ├┤ ├─┤│ ││  │   ├┤  │││ │ │ │├┬┘
# ─┴┘└─┘└  ┴ ┴└─┘┴─┘┴   └─┘─┴┘┴ ┴ └─┘┴└─

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
