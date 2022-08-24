
" ████████╗███╗   ███╗██╗   ██╗██╗  ██╗██╗     ██╗███╗   ██╗███████╗
" ╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝██║     ██║████╗  ██║██╔════╝
"    ██║   ██╔████╔██║██║   ██║ ╚███╔╝ ██║     ██║██╔██╗ ██║█████╗
"    ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗ ██║     ██║██║╚██╗██║██╔══╝
"    ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗███████╗██║██║ ╚████║███████╗
"    ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝

" https://github.com/edkolev/tmuxline.vim

" Airline's theme and following preset will be applied to tmux's statusline,
" when you start vim inside tmux session.

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \ 'a'       : ' #S',
      \ 'cwin'    : ['#I-#P', ' #W'],
      \ 'win'     : ['#I'],
      \ 'y'       : ['%R %a'],
      \ 'z'       : '#(whoami) ',
      \ 'options' : {'status-justify' : 'left'}}

let g:tmuxline_separators = {
      \ 'left' : '',
      \ 'left_alt': '',
      \ 'right' : '',
      \ 'right_alt' : '',
      \ 'space' : ' '
      \ }
