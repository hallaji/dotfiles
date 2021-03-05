# ██████╗ ██╗   ██╗███████╗███╗   ██╗██╗   ██╗
# ██╔══██╗╚██╗ ██╔╝██╔════╝████╗  ██║██║   ██║
# ██████╔╝ ╚████╔╝ █████╗  ██╔██╗ ██║██║   ██║
# ██╔═══╝   ╚██╔╝  ██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
# ██║        ██║   ███████╗██║ ╚████║ ╚████╔╝
# ╚═╝        ╚═╝   ╚══════╝╚═╝  ╚═══╝  ╚═══╝

# @see https://github.com/pyenv/pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
