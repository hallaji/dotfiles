
# ██████╗ ██╗   ██╗███████╗███╗   ██╗██╗   ██╗
# ██╔══██╗╚██╗ ██╔╝██╔════╝████╗  ██║██║   ██║
# ██████╔╝ ╚████╔╝ █████╗  ██╔██╗ ██║██║   ██║
# ██╔═══╝   ╚██╔╝  ██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
# ██║        ██║   ███████╗██║ ╚████║ ╚████╔╝
# ╚═╝        ╚═╝   ╚══════╝╚═╝  ╚═══╝  ╚═══╝

# @see https://github.com/pyenv/pyenv

if type pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi
