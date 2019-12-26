" ██╗   ██╗██╗   ██╗███╗   ██╗██████╗ ██╗     ███████╗
" ██║   ██║██║   ██║████╗  ██║██╔══██╗██║     ██╔════╝
" ██║   ██║██║   ██║██╔██╗ ██║██║  ██║██║     █████╗
" ╚██╗ ██╔╝██║   ██║██║╚██╗██║██║  ██║██║     ██╔══╝
"  ╚████╔╝ ╚██████╔╝██║ ╚████║██████╔╝███████╗███████╗
"   ╚═══╝   ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝╚══════╝

" Vundle is short for Vim bundle and is a Vim plugin manager.
" @see https://github.com/VundleVim/Vundle.vim

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" ┬  ┬┬ ┬┌┐┌┌┬┐┬  ┌─┐
" └┐┌┘│ ││││ │││  ├┤
"  └┘ └─┘┘└┘─┴┘┴─┘└─┘

Plugin 'VundleVim/Vundle.vim'

" ┌┬┐┌─┐┌─┐┬  ┌─┐
"  │ │ ││ ││  └─┐
"  ┴ └─┘└─┘┴─┘└─┘

Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'tpope/vim-surround'
Plugin 'travisjeffery/vim-auto-mkdir'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'cocopon/colorswatch.vim'
Plugin 'cocopon/inspecthi.vim'

" ┌─┐┬ ┬┌┐┌┌┬┐┌─┐─┐ ┬
" └─┐└┬┘│││ │ ├─┤┌┴┬┘
" └─┘ ┴ ┘└┘ ┴ ┴ ┴┴ └─

Plugin 'leafgarland/typescript-vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'flowtype/vim-flow'
Plugin 'jparise/vim-graphql'
Plugin 'pangloss/vim-javascript'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'tpope/vim-markdown'
Plugin 'udalov/kotlin-vim'

" ┌┬┐┬ ┬┌─┐┌┬┐┌─┐┌─┐
"  │ ├─┤├┤ │││├┤ └─┐
"  ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

Plugin 'joshdick/onedark.vim'
Plugin 'cocopon/iceberg.vim'
Plugin 'flrnd/plastic.vim'
Plugin 'w0ng/vim-hybrid'

" ┌┐┌┌─┐┌┬┐  ┬┌┐┌  ┬ ┬┌─┐┌─┐
" ││││ │ │   ││││  │ │└─┐├┤
" ┘└┘└─┘ ┴   ┴┘└┘  └─┘└─┘└─┘

"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'HerringtonDarkholme/yats.vim'
"Plugin 'MaxMEllon/vim-jsx-pretty'
"Plugin 'file:///home/vahid/path/to/plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
