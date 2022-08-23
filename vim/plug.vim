
" ██████╗ ██╗     ██╗   ██╗ ██████╗
" ██╔══██╗██║     ██║   ██║██╔════╝
" ██████╔╝██║     ██║   ██║██║  ███╗
" ██╔═══╝ ██║     ██║   ██║██║   ██║
" ██║     ███████╗╚██████╔╝╚██████╔╝
" ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝

" https://github.com/junegunn/vim-plug

" Automatic installation of vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" ┌┬┐┌─┐┌─┐┬  ┌─┐
"  │ │ ││ ││  └─┐
"  ┴ └─┘└─┘┴─┘└─┘

Plug 'cocopon/colorswatch.vim' " https://github.com/cocopon/colorswatch.vim
Plug 'cocopon/inspecthi.vim' " https://github.com/cocopon/inspecthi.vim
Plug 'editorconfig/editorconfig-vim' " https://github.com/editorconfig/editorconfig-vim
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes' " https://github.com/vim-airline/vim-airline-themes
Plug 'edkolev/tmuxline.vim' " https://github.com/edkolev/tmuxline.vim
Plug 'tpope/vim-vinegar' " https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround
Plug 'travisjeffery/vim-auto-mkdir' " https://github.com/travisjeffery/vim-auto-mkdir
Plug 'jeffkreeftmeijer/vim-numbertoggle' " https://github.com/jeffkreeftmeijer/vim-numbertoggle
Plug 'preservim/vimux' " https://github.com/preservim/vimux
Plug 'preservim/nerdcommenter' " https://github.com/preservim/nerdcommenter
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " https://github.com/iamcco/markdown-preview.nvim
Plug 'neoclide/jsonc.vim' " https://github.com/neoclide/jsonc.vim
Plug 'nvim-treesitter/nvim-treesitter' " https://github.com/nvim-treesitter/nvim-treesitter
if has('nvim')
  Plug 'declancm/cinnamon.nvim' " https://github.com/declancm/cinnamon.nvim
endif

" ┌─┐┌─┐┌─┐┬─┐┌─┐┬ ┬
" └─┐├┤ ├─┤├┬┘│  ├─┤
" └─┘└─┘┴ ┴┴└─└─┘┴ ┴

Plug 'ctrlpvim/ctrlp.vim' " https://github.com/ctrlpvim/ctrlp.vim
Plug 'dyng/ctrlsf.vim' " https://github.com/dyng/ctrlsf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " https://github.com/junegunn/fzf
Plug 'junegunn/fzf.vim' " https://github.com/junegunn/fzf.vim
if has('nvim')
  Plug 'ibhagwan/fzf-lua', {'branch': 'main'} " https://github.com/ibhagwan/fzf-lua
endif

" ┌─┐─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐
" ├┤ ┌┴┬┘├─┘│  │ │├┬┘├┤
" └─┘┴ └─┴  ┴─┘└─┘┴└─└─┘

Plug 'mhinz/vim-startify' " https://github.com/mhinz/vim-startify
Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin' " https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
Plug 'mcchrish/nnn.vim' " https://github.com/mcchrish/nnn.vim

" ┌─┐┬┌┬┐
" │ ┬│ │
" └─┘┴ ┴

Plug 'tpope/vim-fugitive' " https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-rhubarb' " https://github.com/tpope/vim-rhubarb
Plug 'airblade/vim-gitgutter' " https://github.com/airblade/vim-gitgutter
Plug 'mhinz/vim-signify' " https://github.com/mhinz/vim-signify

" ┌┬┐┌─┐┬  ┬┌─┐┬  ┌─┐┌─┐┌┬┐┌─┐┌┐┌┌┬┐
"  ││├┤ └┐┌┘├┤ │  │ │├─┘│││├┤ │││ │
" ─┴┘└─┘ └┘ └─┘┴─┘└─┘┴  ┴ ┴└─┘┘└┘ ┴

Plug 'neoclide/coc.nvim', {'branch': 'release'} " https://github.com/neoclide/coc.nvim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " https://github.com/fatih/vim-go
Plug 'leafgarland/typescript-vim' " https://github.com/leafgarland/typescript-vim
Plug 'jparise/vim-graphql' " https://github.com/jparise/vim-graphql
Plug 'pangloss/vim-javascript' " https://github.com/pangloss/vim-javascript
Plug 'peitalin/vim-jsx-typescript' " https://github.com/peitalin/vim-jsx-typescript
Plug 'udalov/kotlin-vim' " https://github.com/udalov/kotlin-vim

" ┬┌─┐┌─┐┌┐┌┌─┐
" ││  │ ││││└─┐
" ┴└─┘└─┘┘└┘└─┘

Plug 'ryanoasis/vim-devicons' " https://github.com/ryanoasis/vim-devicons

" ┌┐┌┌─┐┌┬┐  ┬┌┐┌  ┬ ┬┌─┐┌─┐
" ││││ │ │   ││││  │ │└─┐├┤
" ┘└┘└─┘ ┴   ┴┘└┘  └─┘└─┘└─┘

" Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary

" Plug 'arcticicestudio/nord-vim'
" Plug 'joshdick/onedark.vim'
" Plug 'flrnd/plastic.vim'
" Plug 'w0ng/vim-hybrid'
"
" Plug 'jelera/vim-javascript-syntax'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/limelight.vim'
"
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'flowtype/vim-flow' " https://github.com/flow/vim-flow
" Plug 'junegunn/gv.vim' " https://github.com/junegunn/gv.vim

call plug#end()
