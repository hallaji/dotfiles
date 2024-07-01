#  ██████╗███╗   ███╗██████╗ ██╗  ████████╗███╗   ██╗███████╗
# ██╔════╝████╗ ████║██╔══██╗██║  ╚══██╔══╝████╗  ██║██╔════╝
# ██║     ██╔████╔██║██████╔╝██║     ██║   ██╔██╗ ██║███████╗
# ██║     ██║╚██╔╝██║██╔═══╝ ██║     ██║   ██║╚██╗██║╚════██║
# ╚██████╗██║ ╚═╝ ██║██║     ███████╗██║   ██║ ╚████║███████║
#  ╚═════╝╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝   ╚═╝  ╚═══╝╚══════╝

# Add homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Add completions provided by fresh
if type fresh &>/dev/null; then
  FPATH=~/.fresh/build/completions:$FPATH
fi

autoload -Uz compinit; compinit
