# ██╗  ██╗████████╗███╗   ██╗███████╗ ██████╗ ███╗   ██╗███████╗
# ╚██╗██╔╝╚══██╔══╝████╗  ██║██╔════╝██╔═══██╗████╗  ██║██╔════╝
#  ╚███╔╝    ██║   ██╔██╗ ██║███████╗██║   ██║██╔██╗ ██║███████╗
#  ██╔██╗    ██║   ██║╚██╗██║╚════██║██║   ██║██║╚██╗██║╚════██║
# ██╔╝ ██╗   ██║   ██║ ╚████║███████║╚██████╔╝██║ ╚████║███████║
# ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

# ┌─┐┬ ┬┌┬┐┬ ┬┌─┐┌─┐┬ ┬
# │ │├─┤│││└┬┘┌─┘└─┐├─┤
# └─┘┴ ┴┴ ┴ ┴ └─┘└─┘┴ ┴
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins

OHMYZSH_PLUGINS=(
  brew
  colored-man-pages
  common-aliases
  gcloud
  git
  history
  macos
  node
  npm
  terraform
  vi-mode
  yarn
  z
)

if [ -d ~/.fresh/build/vendor/ohmyzsh ]; then
  for plugin in ${OHMYZSH_PLUGINS[@]}; do
    source ~/.fresh/build/vendor/ohmyzsh/plugins/$plugin/$plugin.plugin.zsh
  done
fi

# ┌─┐┌┬┐┬ ┬┌─┐┬─┐┌─┐
# │ │ │ ├─┤├┤ ├┬┘└─┐
# └─┘ ┴ ┴ ┴└─┘┴└─└─┘

if [ -d ~/.fresh/build/vendor/zsh-users ]; then
  source ~/.fresh/build/vendor/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/.fresh/build/vendor/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
