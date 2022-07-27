
"  █████╗ ██╗██████╗ ██╗     ██╗███╗   ██╗███████╗
" ██╔══██╗██║██╔══██╗██║     ██║████╗  ██║██╔════╝
" ███████║██║██████╔╝██║     ██║██╔██╗ ██║█████╗
" ██╔══██║██║██╔══██╗██║     ██║██║╚██╗██║██╔══╝
" ██║  ██║██║██║  ██║███████╗██║██║ ╚████║███████╗
" ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝

" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline/wiki/Screenshots

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow' " tomorrow | fruit_punch | distinguished | minimalist

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

