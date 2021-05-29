" ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
" ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
" ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
" ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
" ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
" ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

" Default leader is backslash \ but a , is much better.
let mapleader = ','

" Make it easy to edit dotfiles
nmap <Leader>ed :tabedit $DOTFILES<cr>

" Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

" Make NERDTree easier to toggle
nmap <Leader>q :NERDTreeToggle<cr>

" CtrlP
nmap <Leader>f :CtrlP<cr>
nmap <Leader>a :CtrlPMixed<cr>
nmap <Leader>b :CtrlPBuffer<cr>
nmap <Leader>m :CtrlPMRU<cr>

" Be ready to find a tag using ctags
nmap <Leader>t :tag<space>

" Simpler mappings to switch between splits
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Trim trailing whitespaces
nmap <Leader>w :call TrimWhitespace()<cr>

" Gitgutter
nmap <silent> ]h :call GitGutterNextHunkCycle()<cr>
nmap <silent> [h :call GitGutterPrevHunkCycle()<cr>
nmap <silent> ]c :call GitGutterNextHunkAllBuffers()<cr>
nmap <silent> [c :call GitGutterPrevHunkAllBuffers()<cr>
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
nmap <Leader>hs :GitGutterStageHunk<cr>
nmap <Leader>hu :GitGutterUndoHunk<cr>
nmap <Leader>hf :GitGutterFold<cr>
