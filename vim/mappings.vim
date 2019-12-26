" ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
" ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
" ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
" ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
" ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
" ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

" Default leader is backslash \ but a , is much better.

let mapleader = ','

" Make it easy to edit the vimrc file. n stands for normal mode. cr stands for carriage return.

nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>
nmap <Leader>egv :tabedit ~/.gvimrc<cr>
nmap <Leader>ez :e ~/.zshrc<cr>
nmap <Leader>es :e ~/.vim/snippets/

" Add simple highlight removal.

nmap <Leader><space> :nohlsearch<cr>

" Make NERDTree easier to toggle

nmap <Leader>a :NERDTreeToggle<cr>

" CtrlP

nmap <D-P> :CtrlP<cr>
nmap <D-R> :CtrlPBufTag<cr>
nmap <D-E> :CtrlPMRU<cr>

" Ctags
" Be ready to find a tag

nmap <Leader>f :tag<space>

" Simpler mappings to switch between splits

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
