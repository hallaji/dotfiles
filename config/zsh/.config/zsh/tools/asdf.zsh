#  █████╗ ███████╗██████╗ ███████╗
# ██╔══██╗██╔════╝██╔══██╗██╔════╝
# ███████║███████╗██║  ██║█████╗
# ██╔══██║╚════██║██║  ██║██╔══╝
# ██║  ██║███████║██████╔╝██║
# ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝
# https://asdf-vm.com
# https://github.com/asdf-vm/asdf

# ZSH & Homebrew
source "$(brew --prefix asdf)/libexec/asdf.sh"

# https://github.com/halcyon/asdf-java#java_home
asdf where java &>/dev/null && source ~/.asdf/plugins/java/set-java-home.zsh

# https://github.com/asdf-community/asdf-golang#version-selection
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
