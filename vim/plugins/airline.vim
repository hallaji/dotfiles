
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
let g:airline_symbols.crypt = '﬒'
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.spell = '暈'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.dirty = ' '
let g:airline_symbols.readonly = ''

let g:airline_theme = 'catamaran'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail"
let g:airline_powerline_fonts = 0

let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#color_template = "normal"
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline-colors.conf"

let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S-L',
    \ ''     : 'S-B',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V-L',
    \ ''     : 'V-B',
    \ }
