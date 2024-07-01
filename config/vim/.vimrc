" ██╗   ██╗██╗███╗   ███╗
" ██║   ██║██║████╗ ████║
" ██║   ██║██║██╔████╔██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═══╝  ╚═╝╚═╝     ╚═╝

source ~/.config/vim/settings.vim
source ~/.config/vim/commands.vim
source ~/.config/vim/plug.vim
execute "source" join(split(globpath("~/.config/vim/plugins", "*.vim"), "\n"), " | source ")
source ~/.config/vim/mappings.vim
