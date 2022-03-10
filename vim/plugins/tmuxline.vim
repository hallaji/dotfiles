
" ████████╗███╗   ███╗██╗   ██╗██╗  ██╗██╗     ██╗███╗   ██╗███████╗
" ╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝██║     ██║████╗  ██║██╔════╝
"    ██║   ██╔████╔██║██║   ██║ ╚███╔╝ ██║     ██║██╔██╗ ██║█████╗
"    ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗ ██║     ██║██║╚██╗██║██╔══╝
"    ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗███████╗██║██║ ╚████║███████╗
"    ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝

" Airline's theme and following preset will be applied to tmux's statusline, when you start vim inside tmux session.
" @see https://github.com/edkolev/tmuxline.vim

let g:tmuxline_preset = {
  \'a'       : '#S',
  \'cwin'    : ['#I', '#W'],
  \'win'     : ['#I'],
  \'y'       : ['%R', '%a'],
  \'z'       : '#(whoami)',
  \'options' : {'status-justify' : 'left'}}

let g:tmuxline_separators = {
  \ 'left' : '',
  \ 'left_alt': '',
  \ 'right' : '',
  \ 'right_alt' : '',
  \ 'space' : ' '}
