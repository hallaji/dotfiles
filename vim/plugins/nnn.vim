
" ███╗   ██╗███╗   ██╗███╗   ██╗
" ████╗  ██║████╗  ██║████╗  ██║
" ██╔██╗ ██║██╔██╗ ██║██╔██╗ ██║
" ██║╚██╗██║██║╚██╗██║██║╚██╗██║
" ██║ ╚████║██║ ╚████║██║ ╚████║
" ╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝  ╚═══╝

" https://github.com/mcchrish/nnn.vim
" https://github.com/mcchrish/nnn.vim/blob/master/doc/nnn.txt

let g:nnn#set_default_mappings = 0
let g:nnn#command = 'nnn -eoi'
let g:nnn#replace_netrw = 0
let g:nnn#statusline = 0
let g:nnn#action = {
  \ '<c-t>': 'tab split',
  \ '<c-s>': 'split',
  \ '<c-v>': 'vsplit' }
