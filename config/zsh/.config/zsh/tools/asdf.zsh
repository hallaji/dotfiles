#  █████╗ ███████╗██████╗ ███████╗
# ██╔══██╗██╔════╝██╔══██╗██╔════╝
# ███████║███████╗██║  ██║█████╗
# ██╔══██║╚════██║██║  ██║██╔══╝
# ██║  ██║███████║██████╔╝██║
# ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝
# https://asdf-vm.com
# https://github.com/asdf-vm/asdf


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
