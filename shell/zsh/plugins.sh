
# ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
# ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
# ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
# ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
# ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
# ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝

# ┌─┐┬ ┬┌┬┐┬ ┬┌─┐┌─┐┬ ┬
# │ │├─┤│││└┬┘┌─┘└─┐├─┤
# └─┘┴ ┴┴ ┴ ┴ └─┘└─┘┴ ┴
# @see https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins

OHMYZSH_PLUGINS=(
  common-aliases
  vi-mode
  git
  history
  npm
  yarn
  node
  gcloud
  macos
  z
  colored-man-pages
)

for plugin in ${OHMYZSH_PLUGINS[@]}; do
  source ~/.fresh/build/vendor/ohmyzsh/plugins/$plugin/$plugin.plugin.zsh
done

# ┌─┐┌┬┐┬ ┬┌─┐┬─┐┌─┐
# │ │ │ ├─┤├┤ ├┬┘└─┐
# └─┘ ┴ ┴ ┴└─┘┴└─└─┘

source ~/.fresh/build/vendor/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.fresh/build/vendor/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.fresh/build/vendor/zdharma/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
