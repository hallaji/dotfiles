
" ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
" ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
" ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
" ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
" ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
" ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

syntax enable
colorscheme catamaran

set encoding=UTF-8 " Use UTF-8 as the default encoding
set number " Show line numbers
set ruler " Show the line and column number of the cursor position, separated by a comma
" set colorcolumn=80,120 " Set a ruler in 80 and 120 by default
set foldcolumn=1 " Custom left padding for each window
set cursorline " Highlight the text line of the cursor with CursorLine
set cmdheight=1 " Command height under status line
set nowrap " No wrap by default

set tabstop=2 " Length of an actual \t character
set softtabstop=-1 " Length to use when editing text eg. TAB and BS keys (0 for ‘tabstop’, -1 for ‘shiftwidth’)
set shiftwidth=0 " Length to use when shifting text eg. <<, >> and == commands (0 for ‘tabstop’)
set shiftround " Round indentation to multiples of 'shiftwidth' when shifting text (so that it behaves like Ctrl-D / Ctrl-T)
set expandtab " If set, only insert spaces; otherwise insert \t and complete with spaces
set autoindent " reproduce the indentation of the previous line
" set cpoptions+=I " keep indentation produced by 'autoindent' if leaving the line blank
set smartindent " try to be smart (increase the indenting level after ‘{’, decrease it after ‘}’, and so on)
" set cindent " a stricter alternative which works better for the C language
filetype plugin indent on " use language‐specific plugins for indenting (better)

set mouse=a " Enable scrolling with the scroll wheel
set updatetime=100 " Shorter update time - default is 4000 ms
set hidden " Hide buffers instead of closing them
set nocompatible " Use latest vim settings, not vi
set backspace=indent,eol,start " Make backspace behave like every other editor
set noerrorbells visualbell t_vb= " No bells
set hlsearch " Search highlights
set incsearch
" set shortmess+=c " Don't give ins-completion-menu messages
set splitbelow " Make splits default to below
set splitright " And to the right

set nobackup " Some lang servers have issues with backup files
set nowritebackup " Some lang servers have issues with backup files
