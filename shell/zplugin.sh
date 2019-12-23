# ███████╗██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗
# ╚══███╔╝██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║
#   ███╔╝ ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║
#  ███╔╝  ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║
# ███████╗██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║
# ╚══════╝╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝

source ~/.zplugin/bin/zplugin.zsh

zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/nvm/nvm.plugin.zsh
zplugin snippet OMZ::plugins/npm/npm.plugin.zsh
zplugin snippet OMZ::plugins/yarn/yarn.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zplugin ice wait lucid blockf atpull'zplugin creinstall -q .'
zplugin light zsh-users/zsh-completions

zplugin ice wait lucid as"completion" lucid
zplugin snippet 'https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker'

zplugin ice wait lucid atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

zplugin ice wait lucid atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions
