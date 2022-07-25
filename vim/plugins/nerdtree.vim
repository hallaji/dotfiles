
" ███╗   ██╗███████╗██████╗ ██████╗ ████████╗██████╗ ███████╗███████╗
" ████╗  ██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔════╝██╔════╝
" ██╔██╗ ██║█████╗  ██████╔╝██║  ██║   ██║   ██████╔╝█████╗  █████╗
" ██║╚██╗██║██╔══╝  ██╔══██╗██║  ██║   ██║   ██╔══██╗██╔══╝  ██╔══╝
" ██║ ╚████║███████╗██║  ██║██████╔╝   ██║   ██║  ██║███████╗███████╗
" ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝

" https://github.com/preservim/nerdtree
" https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt

let NERDTreeHijackNetrw = 1
let NERDTreeShowHidden = 0
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 0

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
  \ quit | endif


" https://github.com/Xuyuanp/nerdtree-git-plugin

let g:NERDTreeGitStatusUseNerdFonts = 1
