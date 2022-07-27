
" ███╗   ██╗███████╗██████╗ ██████╗ ████████╗██████╗ ███████╗███████╗
" ████╗  ██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔════╝██╔════╝
" ██╔██╗ ██║█████╗  ██████╔╝██║  ██║   ██║   ██████╔╝█████╗  █████╗
" ██║╚██╗██║██╔══╝  ██╔══██╗██║  ██║   ██║   ██╔══██╗██╔══╝  ██╔══╝
" ██║ ╚████║███████╗██║  ██║██████╔╝   ██║   ██║  ██║███████╗███████╗
" ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝

" https://github.com/preservim/nerdtree
" https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt

let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 0
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeAutoDeleteBuffer=0

" Exit Vim if NERDTree is the only window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" https://github.com/Xuyuanp/nerdtree-git-plugin

let g:NERDTreeGitStatusUseNerdFonts = 1
