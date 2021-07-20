
" ███╗   ██╗███████╗██████╗ ██████╗ ████████╗██████╗ ███████╗███████╗
" ████╗  ██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔════╝██╔════╝
" ██╔██╗ ██║█████╗  ██████╔╝██║  ██║   ██║   ██████╔╝█████╗  █████╗
" ██║╚██╗██║██╔══╝  ██╔══██╗██║  ██║   ██║   ██╔══██╗██╔══╝  ██╔══╝
" ██║ ╚████║███████╗██║  ██║██████╔╝   ██║   ██║  ██║███████╗███████╗
" ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝

" @see https://github.com/preservim/nerdtree

let NERDTreeHijackNetrw = 0

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
  \ quit | endif
