
# ██╗ ██████╗██╗   ██╗██╗  ██╗ ██████╗
# ██║██╔════╝██║   ██║██║  ██║██╔════╝
# ██║██║     ██║   ██║███████║██║
# ██║██║     ██║   ██║╚════██║██║
# ██║╚██████╗╚██████╔╝     ██║╚██████╗
# ╚═╝ ╚═════╝ ╚═════╝      ╚═╝ ╚═════╝
# https://icu.unicode.org/home

export PATH="$(brew --prefix icu4c)/bin:$PATH"
export PATH="$(brew --prefix icu4c)/sbin:$PATH"
export LDFLAGS="-L$(brew --prefix icu4c)/lib"
export CPPFLAGS="-I$(brew --prefix icu4c)/include"
export PKG_CONFIG_PATH="$(brew --prefix icu4c)/lib/pkgconfig"
