
"  █████╗ ██╗██████╗ ██╗     ██╗███╗   ██╗███████╗
" ██╔══██╗██║██╔══██╗██║     ██║████╗  ██║██╔════╝
" ███████║██║██████╔╝██║     ██║██╔██╗ ██║█████╗
" ██╔══██║██║██╔══██╗██║     ██║██║╚██╗██║██╔══╝
" ██║  ██║██║██║  ██║███████╗██║██║ ╚████║███████╗
" ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline/wiki/Screenshots

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.colnr = ' '
let g:airline_symbols.crypt = '󱆄'
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.spell = '󰓆'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = ''
let g:airline_symbols.dirty = ' '
let g:airline_symbols.readonly = '󰌾'

let g:airline_theme = 'catamaran'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail"
let g:airline_powerline_fonts = 0

let g:airline#extensions#tmuxline#enabled = 0
