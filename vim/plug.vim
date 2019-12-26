" ██████╗ ██╗     ██╗   ██╗ ██████╗
" ██╔══██╗██║     ██║   ██║██╔════╝
" ██████╔╝██║     ██║   ██║██║  ███╗
" ██╔═══╝ ██║     ██║   ██║██║   ██║
" ██║     ███████╗╚██████╔╝╚██████╔╝
" ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝

" A minimalist Vim plugin manager.
" @see https://github.com/junegunn/vim-plug

" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" call plug#begin('~/.vim/bundle')

" ┌┬┐┌─┐┌─┐┬  ┌─┐
"  │ │ ││ ││  └─┐
"  ┴ └─┘└─┘┴─┘└─┘

Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-surround'
Plug 'travisjeffery/vim-auto-mkdir'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'cocopon/colorswatch.vim'
Plug 'cocopon/inspecthi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ┌─┐─┐ ┬┌┬┐┌─┐┌┐┌┌─┐┬┌─┐┌┐┌┌─┐
" ├┤ ┌┴┬┘ │ ├┤ │││└─┐││ ││││└─┐
" └─┘┴ └─ ┴ └─┘┘└┘└─┘┴└─┘┘└┘└─┘


" ┌─┐┬ ┬┌┐┌┌┬┐┌─┐─┐ ┬
" └─┐└┬┘│││ │ ├─┤┌┴┬┘
" └─┘ ┴ ┘└┘ ┴ ┴ ┴┴ └─

Plug 'leafgarland/typescript-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'flowtype/vim-flow'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tpope/vim-markdown'
Plug 'udalov/kotlin-vim'

" ┌┬┐┬ ┬┌─┐┌┬┐┌─┐┌─┐
"  │ ├─┤├┤ │││├┤ └─┐
"  ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'flrnd/plastic.vim'
Plug 'w0ng/vim-hybrid'

" ┌┐┌┌─┐┌┬┐  ┬┌┐┌  ┬ ┬┌─┐┌─┐
" ││││ │ │   ││││  │ │└─┐├┤
" ┘└┘└─┘ ┴   ┴┘└┘  └─┘└─┘└─┘

"Plug 'jelera/vim-javascript-syntax'
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'MaxMEllon/vim-jsx-pretty'

"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'

"Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

call plug#end()
