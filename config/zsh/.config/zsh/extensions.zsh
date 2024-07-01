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

for plugin in ${OHMYZSH_PLUGINS[@]}; do
  source ~/.fresh/build/vendor/ohmyzsh/plugins/$plugin/$plugin.plugin.zsh
done

# ┌─┐┌┬┐┬ ┬┌─┐┬─┐┌─┐
# │ │ │ ├─┤├┤ ├┬┘└─┐
# └─┘ ┴ ┴ ┴└─┘┴└─└─┘

source ~/.fresh/build/vendor/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.fresh/build/vendor/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
