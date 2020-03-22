#  ██████╗ ██╗  ██╗███╗   ███╗██╗   ██╗███████╗███████╗██╗  ██╗
# ██╔═══██╗██║  ██║████╗ ████║╚██╗ ██╔╝╚══███╔╝██╔════╝██║  ██║
# ██║   ██║███████║██╔████╔██║ ╚████╔╝   ███╔╝ ███████╗███████║
# ██║   ██║██╔══██║██║╚██╔╝██║  ╚██╔╝   ███╔╝  ╚════██║██╔══██║
# ╚██████╔╝██║  ██║██║ ╚═╝ ██║   ██║   ███████╗███████║██║  ██║
#  ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝

# @see https://ohmyz.sh
# @see https://github.com/ohmyzsh/ohmyzsh

export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z node npm yarn aws gcloud osx docker history vi-mode)

source $ZSH/oh-my-zsh.sh
