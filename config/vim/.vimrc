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
" Inline catamaran-lite — same colors as the two-layer palette in
" config/env/.env, hardcoded on purpose so this stays a single copyable file
" for servers and quick edits (no $PALETTE_* env needed). Each hex is
" annotated with its palette name; tests/unit/palette-sync.bats checks every
" gui* hex is still a palette member. gui* values need 'termguicolors';
" cterm* values are 256-color approximations for terminals and Vim builds
" without truecolor.

set background=dark " Before the overrides — changing it later reloads defaults

" Code (CODE_* roles in the palette)
highlight Comment    ctermfg=60  guifg=#515f72 " CODE_COMMENT (gray)
highlight Constant   ctermfg=218 guifg=#fdaccb " CODE_CONSTANT (rose)
highlight String     ctermfg=43  guifg=#00e8c6 " CODE_STRING (mint)
highlight Identifier ctermfg=218 guifg=#fdaccb cterm=NONE " CODE_IDENTIFIER (rose)
highlight Function   ctermfg=45  guifg=#02d9fe " CODE_FUNCTION (sky)
highlight Statement  ctermfg=39  guifg=#01bdfe cterm=NONE gui=NONE " CODE_KEYWORD (azure)
highlight Operator   ctermfg=204 guifg=#ff4b82 " CODE_OPERATOR (red)
highlight PreProc    ctermfg=215 guifg=#f5b168 " CODE_PREPROCESSOR (amber)
highlight Type       ctermfg=39  guifg=#01bdfe cterm=NONE gui=NONE " CODE_KEYWORD (azure)
highlight Special    ctermfg=211 guifg=#ff75b5 " CODE_SPECIAL (pink)
highlight Todo       ctermfg=215 ctermbg=NONE guifg=#f5b168 guibg=NONE cterm=bold gui=bold " AMBER
highlight Error      ctermfg=254 ctermbg=204 guifg=#e1e4e8 guibg=#ff4b82 " FG0 on RED

" Editor chrome
highlight Normal       ctermfg=254 ctermbg=235  guifg=#e1e4e8 guibg=#242a34 " FG0 on BG2
highlight NonText      ctermfg=238 guifg=#3a4555 " BG4
highlight SpecialKey   ctermfg=238 guifg=#3a4555 " BG4
highlight EndOfBuffer  ctermfg=238 guifg=#3a4555 " BG4
highlight LineNr       ctermfg=60  ctermbg=NONE guifg=#515f72 guibg=NONE " GRAY
highlight CursorLineNr ctermfg=51  guifg=#04f6f6 cterm=bold gui=bold " CYAN
highlight CursorLine   ctermbg=237 guibg=#323a44 cterm=NONE gui=NONE " BG3
highlight ColorColumn  ctermbg=234 guibg=#222831 " BG1
highlight SignColumn   ctermbg=235 guibg=#242a34 " BG2
highlight Folded       ctermfg=103 ctermbg=237 guifg=#8296aa guibg=#323a44 " FG2 on BG3
highlight VertSplit    ctermfg=234 ctermbg=NONE guifg=#1d232b guibg=NONE cterm=NONE gui=NONE " BG0
highlight Visual       ctermbg=238 guibg=#3a4555 " BG4
highlight Search       ctermfg=235 ctermbg=215 guifg=#242a34 guibg=#f5b168 " BG2 on AMBER
highlight IncSearch    ctermfg=235 ctermbg=202 guifg=#242a34 guibg=#ff6b35 cterm=NONE gui=NONE " BG2 on ORANGE
highlight MatchParen   ctermfg=51  ctermbg=238 guifg=#04f6f6 guibg=#3a4555 cterm=bold gui=bold " CYAN on BG4
highlight Directory    ctermfg=45  guifg=#02d9fe " SKY
highlight Title        ctermfg=211 guifg=#ff75b5 cterm=bold gui=bold " PINK

" Menus, status line, tabs
highlight Pmenu        ctermfg=249 ctermbg=237 guifg=#adbac7 guibg=#323a44 " FG1 on BG3
highlight PmenuSel     ctermfg=235 ctermbg=45  guifg=#242a34 guibg=#02d9fe " BG2 on SKY
highlight WildMenu     ctermfg=235 ctermbg=45  guifg=#242a34 guibg=#02d9fe cterm=bold gui=bold " BG2 on SKY
highlight StatusLine   ctermfg=235 ctermbg=45  guifg=#242a34 guibg=#02d9fe cterm=bold gui=bold " BG2 on SKY (MODE_NORMAL)
highlight StatusLineNC ctermfg=103 ctermbg=235 guifg=#8296aa guibg=#202f42 cterm=NONE gui=NONE " FG2 on NAVY
highlight TabLine      ctermfg=103 ctermbg=237 guifg=#8296aa guibg=#323a44 cterm=NONE gui=NONE " FG2 on BG3
highlight TabLineSel   ctermfg=218 ctermbg=235 guifg=#fdaccb guibg=#242a34 cterm=bold gui=bold " ROSE on BG2
highlight TabLineFill  ctermbg=234 guibg=#1d232b cterm=NONE gui=NONE " BG0

" Messages, spelling, diffs
highlight ErrorMsg   ctermfg=254 ctermbg=204  guifg=#e1e4e8 guibg=#ff4b82 " FG0 on RED
highlight WarningMsg ctermfg=215 guifg=#f5b168 " AMBER
highlight MoreMsg    ctermfg=36  guifg=#00b196 " TEAL
highlight Question   ctermfg=36  guifg=#00b196 " TEAL
highlight ModeMsg    ctermfg=45  guifg=#02d9fe cterm=bold gui=bold " SKY
highlight SpellBad   ctermfg=204 cterm=underline guifg=NONE gui=undercurl guisp=#ff4b82 " RED
highlight SpellCap   ctermfg=75  cterm=underline guifg=NONE gui=undercurl guisp=#6fc1ff " BLUE
highlight SpellLocal ctermfg=43  cterm=underline guifg=NONE gui=undercurl guisp=#00e8c6 " MINT
highlight SpellRare  ctermfg=140 cterm=underline guifg=NONE gui=undercurl guisp=#a394cd " PURPLE
highlight DiffAdd    ctermbg=23  guibg=#12352f " vim-only diff tint (not in palette)
highlight DiffDelete ctermfg=204 ctermbg=52 guifg=#ff4b82 guibg=#3a1c28 " RED on vim-only diff tint
highlight DiffChange ctermbg=236 guibg=#2a3240 " vim-only diff tint (not in palette)
highlight DiffText   ctermbg=238 guibg=#3a4555 cterm=NONE gui=NONE " BG4

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
