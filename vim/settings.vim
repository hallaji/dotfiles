
" ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
" ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
" ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
" ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
" ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
" ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

set encoding=utf-8                  " Set internal encoding of vim
set number
set ruler
" set colorcolumn=80,120              " Set a ruler in 80 and 120 by default
set foldcolumn=1                    " Custom left padding for each window
set cursorline
set cmdheight=1                     " Command height under status line
set nowrap                          " No wrap by default

set tabstop=4                       " The width of a TAB is set to 4
set shiftwidth=4                    " Indents will have a width of 4
set softtabstop=4                   " Sets the number of columns for a TAB
set expandtab                       " Expand TABs to spaces

set hidden                          " Hide buffers instead of closing them
set nocompatible                    " Use latest vim settings, not vi
set backspace=indent,eol,start      " Make backspace behave like every other editor

set noerrorbells visualbell t_vb=   " No bells

set hlsearch                        " Search highlights
set incsearch

set mouse=a                         " Enable scrolling with the scroll wheel

set splitbelow                      " Make splits default to below
set splitright                      " And to the right

set updatetime=300                  " Shorter update time - default is 4000 ms

set nobackup                        " Some lang servers have issues with backup files
set nowritebackup                   " Some lang servers have issues with backup files

set shortmess+=c                    " don't give ins-completion-menu messages.

" Always show the signcolumn
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number " Recently vim can merge signcolumn and number column into one
else
  set signcolumn=yes
endif
