" ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
" ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
" ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
" ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
" ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
" ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

set number
set ruler
set colorcolumn=0                   " Set a column guide
set foldcolumn=1                    " Custom left padding for each window
set cursorline
set signcolumn=yes                  " Always have the sign column
set cmdheight=1                     " Command height under status line

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

set noshowmode                      " Turn showmode off because the lightline plugin already shows the mode

set mouse=a                         " Enable scrolling with the scroll wheel

set splitbelow                      " Make splits default to below
set splitright                      " And to the right

set updatetime=100                  " Shorter update time - default is 4000 ms

" set tags=./tags,tags;$HOME          " Look for a tags file in the directory of the current file, up and up until home
