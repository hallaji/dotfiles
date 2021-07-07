#  ██████╗███╗   ███╗██████╗ ██╗  ████████╗███╗   ██╗███████╗
# ██╔════╝████╗ ████║██╔══██╗██║  ╚══██╔══╝████╗  ██║██╔════╝
# ██║     ██╔████╔██║██████╔╝██║     ██║   ██╔██╗ ██║███████╗
# ██║     ██║╚██╔╝██║██╔═══╝ ██║     ██║   ██║╚██╗██║╚════██║
# ╚██████╗██║ ╚═╝ ██║██║     ███████╗██║   ██║ ╚████║███████║
#  ╚═════╝╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝   ╚═╝  ╚═══╝╚══════╝

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

FPATH=~/.fresh/build/completions:$FPATH

autoload -Uz compinit
compinit
