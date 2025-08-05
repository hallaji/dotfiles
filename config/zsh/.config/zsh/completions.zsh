#  ██████╗███╗   ███╗██████╗ ██╗  ████████╗███╗   ██╗███████╗
# ██╔════╝████╗ ████║██╔══██╗██║  ╚══██╔══╝████╗  ██║██╔════╝
# ██║     ██╔████╔██║██████╔╝██║     ██║   ██╔██╗ ██║███████╗
# ██║     ██║╚██╔╝██║██╔═══╝ ██║     ██║   ██║╚██╗██║╚════██║
# ╚██████╗██║ ╚═╝ ██║██║     ███████╗██║   ██║ ╚████║███████║
#  ╚═════╝╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝   ╚═╝  ╚═══╝╚══════╝

if type brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

if type fresh &>/dev/null; then
  fpath=(~/.fresh/build/completions $fpath)
fi

if type assume &>/dev/null; then
  fpath=(~/.granted/zsh_autocomplete/assume/ $fpath)
fi

if type granted &>/dev/null; then
  fpath=(~/.granted/zsh_autocomplete/granted/ $fpath)
fi

autoload -Uz compinit
compinit
