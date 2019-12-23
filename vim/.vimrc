" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

set nocompatible			        "use latest vim settings, not vi

syntax enable
set number                  		"Let's activate line numbers.
set ruler

set backspace=indent,eol,start 		"Make backspace behave like every other editor.
set noerrorbells visualbell t_vb=   "No bells
let mapleader = ',' 			    "The default leader is backslash \ but a comma is much better.

" ██╗   ██╗██╗███████╗██╗   ██╗ █████╗ ██╗     ███████╗
" ██║   ██║██║██╔════╝██║   ██║██╔══██╗██║     ██╔════╝
" ██║   ██║██║███████╗██║   ██║███████║██║     ███████╗
" ╚██╗ ██╔╝██║╚════██║██║   ██║██╔══██║██║     ╚════██║
"  ╚████╔╝ ██║███████║╚██████╔╝██║  ██║███████╗███████║
"   ╚═══╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝

colorscheme theme
"set t_Co=256                    "Use 256 colors. This is useful for terminal Vim.
"set guifont=Fira_Code:h14       "Font name and size
"set linespace=13            	  "Macvim-specific line-height.
"set nowrap
"set macligatures                "Pretty symbols when available.
"set guioptions-=e               "Disable Gui tabs

"Fake custom left padding for each window
"hi LineNr guibg=bg
set foldcolumn=1
"hi foldcolumn guibg=bg
"hi VertSplit guifg=bg guibg=gray22

set cursorline

" enable scrolling with the scroll wheel
set mouse=a

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

set tabstop=4           " The width of a TAB is set to 4.
set shiftwidth=4        " Indents will have a width of 4
set softtabstop=4       " Sets the number of columns for a TAB
set expandtab           " Expand TABs to spaces

"autocmd Filetype html setlocal ts=2 sts=2 sw=2
"autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" ███████╗███████╗ █████╗ ██████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗
" ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║██║████╗  ██║██╔════╝
" ███████╗█████╗  ███████║██████╔╝██║     ███████║██║██╔██╗ ██║██║  ███╗
" ╚════██║██╔══╝  ██╔══██║██╔══██╗██║     ██╔══██║██║██║╚██╗██║██║   ██║
" ███████║███████╗██║  ██║██║  ██║╚██████╗██║  ██║██║██║ ╚████║╚██████╔╝
" ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝

set hlsearch
set incsearch

" ███████╗██████╗ ██╗     ██╗████████╗██╗███╗   ██╗ ██████╗
" ██╔════╝██╔══██╗██║     ██║╚══██╔══╝██║████╗  ██║██╔════╝
" ███████╗██████╔╝██║     ██║   ██║   ██║██╔██╗ ██║██║  ███╗
" ╚════██║██╔═══╝ ██║     ██║   ██║   ██║██║╚██╗██║██║   ██║
" ███████║██║     ███████╗██║   ██║   ██║██║ ╚████║╚██████╔╝
" ╚══════╝╚═╝     ╚══════╝╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝

set splitbelow 		"Make splits default to below...
set splitright		"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
" ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
" ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
" ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
" ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
" ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

"Make it easy to edit the vimrc file. n stands for normal mode. cr stands for carriage return.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>
nmap <Leader>egv :tabedit ~/.gvimrc<cr>
nmap <Leader>ez :e ~/.zshrc<cr>
nmap <Leader>es :e ~/.vim/snippets/

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <Leader>a :NERDTreeToggle<cr>

"CtrlP
nmap <D-P> :CtrlP<cr>
nmap <D-R> :CtrlPBufTag<cr>
nmap <D-E> :CtrlPMRU<cr>

"Ctags
"Be ready to find a tag
nmap <Leader>f :tag<space>

" ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
" ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
" ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
" ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
" ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
" ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝

"CtrlP
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

"NERDTree
let NERDTreeHijackNetrw = 0

"Greplace
"Use ag for the search
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"Lightline
set laststatus=2
set noshowmode         "Turn showmode off because the lightline plugin already shows the mode.
"Color schemes: powerline, wombat, seoul256, one
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"  █████╗ ██╗   ██╗████████╗ ██████╗
" ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗
" ███████║██║   ██║   ██║   ██║   ██║
" ██╔══██║██║   ██║   ██║   ██║   ██║
" ██║  ██║╚██████╔╝   ██║   ╚██████╔╝
" ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝

"Automatically source the vimrc file on save.
augroup autosourcing
    autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
