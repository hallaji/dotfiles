#      ██╗███████╗███╗   ██╗██╗   ██╗
#      ██║██╔════╝████╗  ██║██║   ██║
#      ██║█████╗  ██╔██╗ ██║██║   ██║
# ██   ██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
# ╚█████╔╝███████╗██║ ╚████║ ╚████╔╝
#  ╚════╝ ╚══════╝╚═╝  ╚═══╝  ╚═══╝
# http://www.jenv.be
# https://github.com/jenv/jenv


type jenv &>/dev/null && eval "$(jenv init -)"

if [ -d "$HOME/.jenv" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
fi
