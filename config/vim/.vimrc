" ██╗   ██╗██╗███╗   ███╗
" ██║   ██║██║████╗ ████║
" ██║   ██║██║██╔████╔██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═══╝  ╚═╝╚═╝     ╚═╝
"
" Minimal, self-contained Vim for servers and quick edits. Mirrors the Neovim
" bindings (docs/NEOVIM.md) without the plugin stack — copy this single file to
" any machine and everything works in plain Vim; the plugins at the bottom are
" optional extras.

" ┌─┐┌─┐┌┬┐┌┬┐┬┌┐┌┌─┐┌─┐
" └─┐├┤  │  │ │││││ ┬└─┐
" └─┘└─┘ ┴  ┴ ┴┘└┘└─┘└─┘

set nocompatible " Use latest vim settings, not vi
syntax enable
filetype plugin indent on " Use language-specific plugins for indenting

set encoding=UTF-8 " Use UTF-8 as the default encoding
set number " Show line numbers
set relativenumber " Show relative line numbers
set ruler " Show the line and column number of the cursor position
set colorcolumn=80,120 " Set a ruler in 80 and 120 by default
set cursorline " Highlight the text line of the cursor
set nowrap " No wrap by default
set laststatus=2 " Always show the status line

" Use the system clipboard when this build supports it
if has('clipboard')
  set clipboard^=unnamed
  if has('unnamedplus')
    set clipboard^=unnamedplus
  endif
endif

set tabstop=2 " Length of an actual \t character
set shiftwidth=0 " Length to use when shifting text (0 for 'tabstop')
set softtabstop=-1 " Length to use when editing text (-1 for 'shiftwidth')
set shiftround " Round indentation to multiples of 'shiftwidth' when shifting
set expandtab " Only insert spaces, never \t
set autoindent " Reproduce the indentation of the previous line
set smartindent " Increase the indenting level after '{', decrease it after '}'

set mouse=a " Enable scrolling with the scroll wheel
set updatetime=100 " Shorter update time - default is 4000 ms
set timeoutlen=500 " Waiting time for keystroke
set hidden " Hide buffers instead of closing them
set noswapfile " No swap files
set backspace=indent,eol,start " Make backspace behave like every other editor
set noerrorbells visualbell t_vb= " No bells
set hlsearch " Search highlights
set incsearch " Show matches while typing a search command
set splitbelow " Make splits default to below
set splitright " And to the right
set wildmenu " Command-line completion menu
set path+=** " Recursive :find as the plugin-less file finder
set exrc secure " Allow per-directory .vimrc/.exrc, restricted to safe commands

" Enable 24-bit RGB color in the TUI
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Netrw (built-in file explorer)
let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_sort_options = 'i'

" ┌┬┐┬ ┬┌─┐┌┬┐┌─┐
"  │ ├─┤├┤ │││├┤
"  ┴ ┴ ┴└─┘┴ ┴└─┘
" Inline catamaran-lite — same palette as the Neovim theme
" (config/neovim/.config/nvim/lua/palettes/catamaran.lua) without a colors
" file, so this stays a single copyable file. gui* values need
" 'termguicolors'; cterm* values are 256-color approximations for terminals
" and Vim builds without truecolor.

set background=dark " Before the overrides — changing it later reloads defaults

" Syntax
highlight Comment    ctermfg=60  guifg=#515f72
highlight Constant   ctermfg=218 guifg=#f9bcd3
highlight String     ctermfg=43  guifg=#00e8c6
highlight Identifier ctermfg=218 guifg=#fdaccb cterm=NONE
highlight Function   ctermfg=45  guifg=#02d9fe
highlight Statement  ctermfg=39  guifg=#01bdfe cterm=NONE gui=NONE
highlight Operator   ctermfg=204 guifg=#ff4b82
highlight PreProc    ctermfg=216 guifg=#ffb582
highlight Type       ctermfg=39  guifg=#01bdfe cterm=NONE gui=NONE
highlight Special    ctermfg=211 guifg=#ff75b5
highlight Todo       ctermfg=215 ctermbg=NONE guifg=#f5b168 guibg=NONE cterm=bold gui=bold
highlight Error      ctermfg=254 ctermbg=204 guifg=#e1e4e8 guibg=#ff4b82

" Editor chrome
highlight Normal       ctermfg=254 ctermbg=235  guifg=#e1e4e8 guibg=#242a34
highlight NonText      ctermfg=238 guifg=#3a4555
highlight SpecialKey   ctermfg=238 guifg=#3a4555
highlight EndOfBuffer  ctermfg=238 guifg=#3a4555
highlight LineNr       ctermfg=60  ctermbg=NONE guifg=#515f72 guibg=NONE
highlight CursorLineNr ctermfg=51  guifg=#04f6f6 cterm=bold gui=bold
highlight CursorLine   ctermbg=237 guibg=#323a44 cterm=NONE gui=NONE
highlight ColorColumn  ctermbg=234 guibg=#222831
highlight SignColumn   ctermbg=235 guibg=#242a34
highlight Folded       ctermfg=103 ctermbg=237 guifg=#8296aa guibg=#323a44
highlight VertSplit    ctermfg=234 ctermbg=NONE guifg=#1d232b guibg=NONE cterm=NONE gui=NONE
highlight Visual       ctermbg=238 guibg=#3a4555
highlight Search       ctermfg=235 ctermbg=215 guifg=#242a34 guibg=#f5b168
highlight IncSearch    ctermfg=235 ctermbg=202 guifg=#242a34 guibg=#ff6b35 cterm=NONE gui=NONE
highlight MatchParen   ctermfg=51  ctermbg=238 guifg=#04f6f6 guibg=#3a4555 cterm=bold gui=bold
highlight Directory    ctermfg=45  guifg=#02d9fe
highlight Title        ctermfg=211 guifg=#ff75b5 cterm=bold gui=bold

" Menus, status line, tabs
highlight Pmenu        ctermfg=249 ctermbg=237 guifg=#adbac7 guibg=#323a44
highlight PmenuSel     ctermfg=235 ctermbg=45  guifg=#242a34 guibg=#02d9fe
highlight WildMenu     ctermfg=235 ctermbg=45  guifg=#242a34 guibg=#02d9fe cterm=bold gui=bold
highlight StatusLine   ctermfg=235 ctermbg=45  guifg=#242a34 guibg=#02d9fe cterm=bold gui=bold
highlight StatusLineNC ctermfg=103 ctermbg=234 guifg=#8296aa guibg=#1b2839 cterm=NONE gui=NONE
highlight TabLine      ctermfg=103 ctermbg=237 guifg=#8296aa guibg=#323a44 cterm=NONE gui=NONE
highlight TabLineSel   ctermfg=218 ctermbg=235 guifg=#fdaccb guibg=#242a34 cterm=bold gui=bold
highlight TabLineFill  ctermbg=234 guibg=#1d232b cterm=NONE gui=NONE

" Messages, spelling, diffs
highlight ErrorMsg   ctermfg=254 ctermbg=204  guifg=#e1e4e8 guibg=#ff4b82
highlight WarningMsg ctermfg=215 guifg=#f5b168
highlight MoreMsg    ctermfg=36  guifg=#00b196
highlight Question   ctermfg=36  guifg=#00b196
highlight ModeMsg    ctermfg=45  guifg=#02d9fe cterm=bold gui=bold
highlight SpellBad   ctermfg=204 cterm=underline guifg=NONE gui=undercurl guisp=#ff4b82
highlight SpellCap   ctermfg=75  cterm=underline guifg=NONE gui=undercurl guisp=#6fc1ff
highlight SpellLocal ctermfg=43  cterm=underline guifg=NONE gui=undercurl guisp=#00e8c6
highlight SpellRare  ctermfg=140 cterm=underline guifg=NONE gui=undercurl guisp=#a394cd
highlight DiffAdd    ctermbg=23  guibg=#12352f
highlight DiffDelete ctermfg=204 ctermbg=52 guifg=#ff4b82 guibg=#3a1c28
highlight DiffChange ctermbg=236 guibg=#2a3240
highlight DiffText   ctermbg=238 guibg=#3a4555 cterm=NONE gui=NONE

" ┌─┐┌─┐┌┬┐┌┬┐┌─┐┌┐┌┌┬┐┌─┐
" │  │ │││││││├─┤│││ ││└─┐
" └─┘└─┘┴ ┴┴ ┴┴ ┴┘└┘─┴┘└─┘

augroup vimrc
  autocmd!
  " Reload buffers changed outside of Vim
  autocmd CursorHold,CursorHoldI * checktime
  autocmd FocusGained,BufEnter * checktime
  " Syntax for files Vim doesn't detect on its own
  autocmd BufNewFile,BufRead .env* set syntax=sh
  autocmd BufNewFile,BufRead *.example set filetype=conf
  autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' && empty(&filetype) | set syntax=sh | endif
  " Spell check in git commit messages
  autocmd FileType gitcommit setlocal spell spelllang=en_au
augroup END

" ┌─┐┬  ┬ ┬┌─┐┬┌┐┌┌─┐
" ├─┘│  │ ││ ┬││││└─┐
" ┴  ┴─┘└─┘└─┘┴┘└┘└─┘
" Optional — everything else in this file works without them.

" Built-in gc-commenting (Vim 9.1+) as the plugin-less fallback
silent! packadd comment

" Bootstrap vim-plug when curl is available; offline boxes skip plugins entirely
let s:plug = expand('~/.vim/autoload/plug.vim')
if !filereadable(s:plug) && executable('curl')
  silent execute '!curl -sfLo' s:plug '--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if filereadable(s:plug)
  call plug#begin('~/.vim/plugged')
  Plug 'christoomey/vim-tmux-navigator' " <C-H/J/K/L> across vim splits and tmux panes
  Plug 'tpope/vim-commentary' " gc / <Leader>/ commenting
  Plug 'tpope/vim-surround' " ys/cs/ds surroundings
  Plug 'junegunn/fzf' " https://github.com/junegunn/fzf
  Plug 'junegunn/fzf.vim' " <C-P> files, <C-G> buffers
  call plug#end()
endif

" ┌┬┐┌─┐┌─┐┌─┐┬┌┐┌┌─┐┌─┐
" │││├─┤├─┘├─┘│││││ ┬└─┐
" ┴ ┴┴ ┴┴  ┴  ┴┘└┘└─┘└─┘
" Same keys as the Neovim config (docs/NEOVIM.md), minus plugin-only features.

let mapleader = ',' " A prefix key (default is backslash)
let maplocalleader = '\\' " A prefix key that only takes effect for certain file types

" Re-copy selected area on paste operation (vim paste has no memory)
xnoremap p pgvy

" Use <C-n>i to send <C-i> because <C-i> is same as <tab> when received by vim
" Check Alacritty bindings for <C-i>
nnoremap <C-n>i <C-i>

" Make Y behave like other capitals
nnoremap Y y$

" Replay macro recording with Q
nnoremap Q @q

" Copy/paste from/to system clipboard in visual/select mode
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p

" Toggles
nnoremap <silent> <Leader><Space> :nohlsearch<CR>
vnoremap <silent> <Leader><Space> :<C-u>nohlsearch<CR>
nnoremap <Leader>n :set norelativenumber number!<CR>
nnoremap <Leader>N :set relativenumber!<CR>
nnoremap <Leader>r :execute "set colorcolumn=" . (&colorcolumn == "" ? "80,120" : "")<CR>
nnoremap <Leader>S :set spell! spelllang=en_au<CR>
nnoremap <Leader>w :set wrap! wrap?<CR>

" Trim trailing whitespace (MiniTrailspace in Neovim)
nnoremap <silent> <Leader>T :keeppatterns %s/\s\+$//e<CR>

" Toggle comment — gc from vim-commentary or Vim 9.1's built-in comment package
nmap <Leader>/ gcc
xmap <Leader>/ gc

" Jump between splits — native fallbacks; vim-tmux-navigator overrides these
" with tmux-aware versions when installed
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Resize splits
nnoremap <C-Left> <C-W><
nnoremap <C-Down> <C-W>-
nnoremap <C-Up> <C-W>+
nnoremap <C-Right> <C-W>>

" Circle windows (splits)
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Circle buffers
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>

" Circle tabs
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>

" Save / quit
nnoremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <Esc>:q<CR>
vnoremap <C-Q> <Esc>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>

" Buffers
nnoremap <silent> <Leader>bQ :qa<CR>
nnoremap <silent> <Leader>ba :b#<CR>
nnoremap <silent> <Leader>bc :bd<CR>
nnoremap <silent> <Leader>bf :bfirst<CR>
nnoremap <silent> <Leader>bl :blast<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>bq :q<CR>
nnoremap <silent> <Leader>bs :update<CR>

" File explorer (netrw)
nnoremap <silent> _ :Explore<CR>

" File / buffer finder — fzf when available, native :find / :b otherwise
if executable('fzf') && isdirectory(expand('~/.vim/plugged/fzf.vim'))
  nnoremap <C-P> :Files<CR>
  nnoremap <C-G> :Buffers<CR>
else
  nnoremap <C-P> :find *
  nnoremap <C-G> :ls<CR>:b<Space>
endif
