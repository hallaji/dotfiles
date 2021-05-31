" ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
" ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
" ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
" ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
" ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
" ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

" Default leader is backslash \ but a , is much better.
let mapleader = ','

" Make it easy to edit dotfiles
nmap <leader>ed :tabedit $DOTFILES<cr>

" Add simple highlight removal.
nmap <leader><space> :nohlsearch<cr>

" Make NERDTree easier to toggle
nmap <leader>q :NERDTreeToggle<cr>

" CtrlP
nmap <leader>f :CtrlP<cr>
nmap <leader>a :CtrlPMixed<cr>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>m :CtrlPMRU<cr>

" Be ready to find a tag using ctags
nmap <leader>t :tag<space>

" Simpler mappings to switch between splits
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Trim trailing whitespaces
nmap <leader>w :call TrimWhitespace()<cr>

" Gitgutter
nmap <silent> ]h :call GitGutterNextHunkCycle()<cr>
nmap <silent> [h :call GitGutterPrevHunkCycle()<cr>
nmap <silent> ]c :call GitGutterNextHunkAllBuffers()<cr>
nmap <silent> [c :call GitGutterPrevHunkAllBuffers()<cr>
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs :GitGutterStageHunk<cr>
nmap <leader>hu :GitGutterUndoHunk<cr>
nmap <leader>hf :GitGutterFold<cr>
