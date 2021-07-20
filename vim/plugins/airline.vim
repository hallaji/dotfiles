
"  █████╗ ██╗██████╗ ██╗     ██╗███╗   ██╗███████╗
" ██╔══██╗██║██╔══██╗██║     ██║████╗  ██║██╔════╝
" ███████║██║██████╔╝██║     ██║██╔██╗ ██║█████╗
" ██╔══██║██║██╔══██╗██║     ██║██║╚██╗██║██╔══╝
" ██║  ██║██║██║  ██║███████╗██║██║ ╚████║███████╗
" ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝

" @see https://github.com/vim-airline/vim-airline
" @see https://github.com/vim-airline/vim-airline/wiki/Screenshots

let g:airline#extensions#tabline#enabled = 1          " Enable Tabline extension
let g:airline#extensions#ale#enabled = 1              " Enable Ale extension

" tomorrow, iceberg, ravenpower, fruit_punch, peaksea, distinguished,
" fairyfloss, base16color, onedark, hybrid, hybridline, minimalist
let g:airline_theme='tomorrow'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
