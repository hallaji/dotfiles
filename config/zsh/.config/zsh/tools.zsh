# ████████╗ ██████╗  ██████╗ ██╗     ███████╗
# ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
#    ██║   ██║   ██║██║   ██║██║     ███████╗
#    ██║   ██║   ██║██║   ██║██║     ╚════██║
#    ██║   ╚██████╔╝╚██████╔╝███████╗███████║
#    ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
# The order determines when each tool modifies the environment.
# Most tools prepend to $PATH so their binaries take priority.

# ┌─┐┌┐┌┌─┐  ┌─┐┌─┐┌─┐┌─┐┬ ┬┌─┐┬─┐┌┬┐
# │ ││││├┤   ├─┘├─┤└─┐└─┐││││ │├┬┘ ││
# └─┘┘└┘└─┘  ┴  ┴ ┴└─┘└─┘└┴┘└─┘┴└──┴┘
# https://developer.1password.com/docs/cli/

type op &>/dev/null && eval "$(op completion zsh)"; compdef _op op


# ┌┬┐┬┬─┐┌─┐┌┐┌┬  ┬
#  │││├┬┘├┤ │││└┐┌┘
# ─┴┘┴┴└─└─┘┘└┘ └┘
# https://direnv.net
# https://github.com/direnv/direnv

type direnv &>/dev/null && eval "$(direnv hook zsh)"


# ┌─┐┬─┐┌─┐┌─┐┬ ┬  ┌─┐┬ ┬┌─┐┬  ┬
# ├┤ ├┬┘├┤ └─┐├─┤  └─┐├─┤├┤ │  │
# └  ┴└─└─┘└─┘┴ ┴  └─┘┴ ┴└─┘┴─┘┴─┘
# https://freshshell.com/

source ~/.fresh/build/shell.sh 2>/dev/null || :


# ┌─┐┌─┐┌─┐
# ├┤ ┌─┘├┤
# └  └─┘└
# https://github.com/junegunn/fzf

# Set default fzf options
export FZF_DEFAULT_OPTS="
  --style=minimal
  --color=fg:$PALETTE_BA_SECONDARY_FG
  --color=bg:$PALETTE_BA_PRIMARY_BG
  --color=hl:$PALETTE_SE_PRIMARY
  --color=fg+:$PALETTE_BA_PRIMARY_FG
  --color=bg+:$PALETTE_BA_SECONDARY_BG
  --color=hl+:$PALETTE_SE_FOCUS
  --color=info:$PALETTE_SE_INFO
  --color=prompt:$PALETTE_SE_SECONDARY
  --color=pointer:$PALETTE_SE_PRIMARY
  --color=marker:$PALETTE_SE_SUCCESS
  --color=spinner:$PALETTE_SE_WARNING
  --color=header:$PALETTE_SE_FOCUS
  --color=border:$PALETTE_UI_BORDER
  --layout=reverse
  --border=rounded
"

# Set up fzf key bindings and fuzzy completion
type fzf &>/dev/null && source <(fzf --zsh)


# ┌─┐┌─┐┬  ┌─┐┬ ┬┌┬┐
# │ ┬│  │  │ ││ │ ││
# └─┘└─┘┴─┘└─┘└─┘─┴┘
# https://cloud.google.com/cli?hl=en

if type gcloud &>/dev/null; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi


# ┬┌─┐┬ ┬
# ││  │ │
# ┴└─┘└─┘
# https://icu.unicode.org/home

if type brew &> /dev/null && brew --prefix icu4c &> /dev/null; then
  export PATH="$(brew --prefix icu4c)/bin:$PATH"
  export PATH="$(brew --prefix icu4c)/sbin:$PATH"
  export LDFLAGS="-L$(brew --prefix icu4c)/lib"
  export CPPFLAGS="-I$(brew --prefix icu4c)/include"
  export PKG_CONFIG_PATH="$(brew --prefix icu4c)/lib/pkgconfig"
fi


#  ┬┌─┐┌┐┌┬  ┬
#  │├┤ │││└┐┌┘
# └┘└─┘┘└┘ └┘
# http://www.jenv.be
# https://github.com/jenv/jenv

type jenv &>/dev/null && eval "$(jenv init -)"

if [ -d "$HOME/.jenv" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
fi


# ┌┐┌┌┐┌┌┐┌
# │││││││││
# ┘└┘┘└┘┘└┘
# https://github.com/mcchrish/nnn.vim
# https://github.com/mcchrish/nnn.vim/blob/master/doc/nnn.txt

n () {
  # Block nesting of nnn in subshells
  if [[ "${NNNLVL:-0}" -ge 1 ]]; then
    echo "nnn is already running"
    return
  fi

  # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
  # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
  # see. To cd on quit only on ^G, remove the "export" and make sure not to
  # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
  #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

  # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
  # stty start undef
  # stty stop undef
  # stty lwrap undef
  # stty lnext undef

  # The backslash allows one to alias n to nnn if desired without making an
  # infinitely recursive alias
  \nnn "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}


# ┌─┐┬─┐┌┐ ┌─┐┌┬┐┌─┐┌─┐┬┌─
# │ │├┬┘├┴┐└─┐ │ ├─┤│  ├┴┐
# └─┘┴└─└─┘└─┘ ┴ ┴ ┴└─┘┴ ┴
# https://orbstack.dev

source ~/.orbstack/shell/init.zsh 2>/dev/null || :


# ┌─┐┌┐┌┌─┐┌┬┐
# ├─┘│││├─┘│││
# ┴  ┘└┘┴  ┴ ┴
# https://pnpm.io

export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# ┌─┐┬ ┬┌─┐┌┐┌┬  ┬
# ├─┘└┬┘├┤ │││└┐┌┘
# ┴   ┴ └─┘┘└┘ └┘
# https://github.com/pyenv/pyenv

if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi


# ┬─┐┌─┐┌┐┌┌─┐┬ ┬┌─┐┬─┐
# ├┬┘├─┤││││  ├─┤├┤ ├┬┘
# ┴└─┴ ┴┘└┘└─┘┴ ┴└─┘┴└─
# https://rancherdesktop.io

export PATH="$HOME/.rd/bin:$PATH"


# ┌─┐┌┬┐┌─┐┬─┐┌─┐┬ ┬┬┌─┐
# └─┐ │ ├─┤├┬┘└─┐├─┤│├─┘
# └─┘ ┴ ┴ ┴┴└─└─┘┴ ┴┴┴
# https://starship.rs

type starship &>/dev/null && eval "$(starship init zsh)"


# ┌─┐┌┬┐┌─┐┌┐┌┬┌─
# ├─┘ │ ├┤ │││├┴┐
# ┴   ┴ └─┘┘└┘┴ ┴
# https://github.com/romkatv/powerlevel10k

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ┌─┐┌─┐─┐ ┬┬┌┬┐┌─┐
# ┌─┘│ │┌┴┬┘│ ││├┤
# └─┘└─┘┴ └─┴─┴┘└─┘
# https://github.com/ajeetdsouza/zoxide

eval "$(zoxide init zsh)"


# ┬ ┬┌─┐┌┬┐┌─┐┌┐ ┬─┐┌─┐┬ ┬
# ├─┤│ ││││├┤ ├┴┐├┬┘├┤ │││
# ┴ ┴└─┘┴ ┴└─┘└─┘┴└─└─┘└┴┘
# https://brew.sh/

type brew &>/dev/null && eval "$(brew shellenv)"


# ┌─┐┌─┐┌┬┐┌─┐
# ├─┤└─┐ ││├┤
# ┴ ┴└─┘─┴┘└
# https://asdf-vm.com

if [[ "$OSTYPE" == "darwin"* ]] && type brew &> /dev/null; then
  source "$(brew --prefix asdf)/libexec/asdf.sh" 2>/dev/null || :
else
  source /opt/asdf-vm/asdf.sh 2>/dev/null || :
fi
if type asdf &> /dev/null; then
  # https://github.com/halcyon/asdf-java#java_home
  asdf where java &>/dev/null && source ~/.asdf/plugins/java/set-java-home.zsh

  # https://github.com/asdf-community/asdf-golang#version-selection
  export ASDF_GOLANG_MOD_VERSION_ENABLED=true
fi


# ┌┬┐┌─┐┬  ┬┌┐ ┌─┐─┐ ┬
#  ││├┤ └┐┌┘├┴┐│ │┌┴┬┘
# ─┴┘└─┘ └┘ └─┘└─┘┴ └─
# https://www.jetify.com/docs/devbox/

type devbox &>/dev/null && eval "$(devbox global shellenv --init-hook)"
