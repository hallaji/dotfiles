" Hide buffers instead of closing them.
set hidden

" Use latest vim settings, not vi
set nocompatible

syntax enable
set number
set ruler

" Make backspace behave like every other editor.
set backspace=indent,eol,start

" No bells
set noerrorbells visualbell t_vb=

" Search highlights
set hlsearch
set incsearch

" Turn showmode off because the lightline plugin already shows the mode.
set noshowmode

" Enable scrolling with the scroll wheel
set mouse=a

" Splitting
" Make splits default to below...
set splitbelow
" And to the right. This feels more natural.
set splitright

" Automatically source the vimrc file on save.
augroup autosourcing
    autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
