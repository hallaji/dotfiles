
" ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
" ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
" ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
" ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
" ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
" ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
" https://vimdoc.sourceforge.net/htmldoc/map.html

let mapleader = ',' " A prefix key (default is backslash)
let maplocalleader = '\\' " A prefix key that only take effect for certain types of files

" ┌─┐┌─┐┌┐┌┌─┐┬─┐┌─┐┬
" │ ┬├┤ │││├┤ ├┬┘├─┤│
" └─┘└─┘┘└┘└─┘┴└─┴ ┴┴─┘

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
vnoremap <leader>p "*p
vnoremap <leader>y "*y

" ┬  ┬┬┌─┐┬ ┬┌─┐┬
" └┐┌┘│└─┐│ │├─┤│
"  └┘ ┴└─┘└─┘┴ ┴┴─┘

map <leader>/ <plug>NERDCommenterToggle
nmap <leader>d :nohlsearch<cr>
nmap <leader>m <Plug>MarkdownPreviewToggle
nmap <leader>t :call v:lua.MiniTrailspace.trim()<cr>
nmap <leader>z :ZenMode<cr>
nnoremap <C-X> :WhichKey<cr>
nnoremap <leader>i :IndentLinesToggle<cr>
nnoremap <leader>l :Limelight!!<cr>
nnoremap <leader>n :set norelativenumber \| :set number!<cr>
nnoremap <leader>N :set relativenumber!<cr>
nnoremap <leader>r :execute "set colorcolumn=" . (&colorcolumn == "" ? "80,120" : "")<cr>
nnoremap <leader>s :set spell! spelllang=en_au<cr>
nnoremap <leader>w :set wrap! wrap?<cr>

" ┌┐┌┌─┐┬  ┬┬┌─┐┌─┐┌┬┐┬┌─┐┌┐┌
" │││├─┤└┐┌┘││ ┬├─┤ │ ││ ││││
" ┘└┘┴ ┴ └┘ ┴└─┘┴ ┴ ┴ ┴└─┘┘└┘

" Jump between splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Resize splits
nnoremap <C-Left> <C-W><
nnoremap <C-Down> <C-W>-
nnoremap <C-Up> <C-W>+
nnoremap <C-Right> <C-W>>

" Circle windows (splits)
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Circle buffers
nnoremap [b :bprev<cr>
nnoremap ]b :bnext<cr>

" Circle tabs
nnoremap [t :tabp<cr>
nnoremap ]t :tabn<cr>

" ┌─┐┌─┐┌─┐┬┬  ┌─┐┌┬┐
" │  │ │├─┘││  │ │ │
" └─┘└─┘┴  ┴┴─┘└─┘ ┴

nnoremap <leader>pi :Copilot setup<cr>
nnoremap <leader>pa :Copilot panel<cr>
nnoremap <leader>pe :Copilot enable<cr>
nnoremap <leader>pd :Copilot disable<cr>
nnoremap <leader>ps :Copilot status<cr>
nnoremap <leader>po :Copilot signout<cr>
nnoremap <leader>pu <Plug>(copilot-suggest)
nnoremap <leader>pn <Plug>(copilot-next)
nnoremap <leader>pp <Plug>(copilot-previous)
nnoremap <leader>pm <Plug>(copilot-dismiss)

" ┌┐ ┬ ┬┌─┐┌─┐┌─┐┬─┐
" ├┴┐│ │├┤ ├┤ ├┤ ├┬┘
" └─┘└─┘└  └  └─┘┴└─

inoremap <C-Q> <esc>:q<cr>
inoremap <silent> <C-S> <C-O>:update<cr>
nnoremap <C-Q> :q<cr>
nnoremap <silent> <C-S> :update<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>bQ :qa!<cr>
nnoremap <silent> <leader>bc :bd<cr>
nnoremap <silent> <leader>bf :bfirst<cr>
nnoremap <silent> <leader>bh :Startify<cr>
nnoremap <silent> <leader>bl :blast<cr>
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bp :bprevious<cr>
nnoremap <leader>bq :q<cr>
nnoremap <silent> <leader>bs :update<cr>
vnoremap <C-Q> <esc>

" ┌─┐┌─┐┌─┐┌┐┌
" │ │├─┘├┤ │││
" └─┘┴  └─┘┘└┘

" Edit my dotfiles in a new tab
nnoremap <silent> <leader>od :tabedit $DOTFILES_HOME<cr>

" ┌─┐┬┌┐┌┌┬┐
" ├┤ ││││ ││
" └  ┴┘└┘─┴┘

inoremap <C-f> <esc>:FzfLua<cr>
nnoremap <C-f> :FzfLua<cr>
vnoremap <C-f> <esc>:FzfLua<cr>
nnoremap <leader>F <Plug>CtrlSFPrompt
nnoremap <leader>f :FzfLua<cr>
nnoremap <leader>fb :FzfLua buffers<cr>

" ┬─┐┌─┐┌─┐┬  ┌─┐┌─┐┌─┐
" ├┬┘├┤ ├─┘│  ├─┤│  ├┤
" ┴└─└─┘┴  ┴─┘┴ ┴└─┘└─┘

nnoremap <leader>rc :CtrlSFClearHL<cr>
nnoremap <leader>rf :CtrlSFFocus<cr>
nnoremap <leader>rl <Plug>CtrlSFPwordExec
nnoremap <leader>ro :CtrlSFOpen<cr>
nnoremap <leader>rp <Plug>CtrlSFPrompt
nnoremap <leader>rs <Plug>CtrlSFVwordExec
nnoremap <leader>rt :CtrlSFToggle<cr>
nnoremap <leader>ru :CtrlSFUpdate<cr>
nnoremap <leader>rw <Plug>CtrlSFCwordExec
nnoremap <leader>rz <Plug>CtrlSFCCwordExec

" ┌─┐─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐┬─┐
" ├┤ ┌┴┬┘├─┘│  │ │├┬┘├┤ ├┬┘
" └─┘┴ └─┴  ┴─┘└─┘┴└─└─┘┴└─

nnoremap <silent> _ :Explore<cr>
nnoremap <silent> ~ :NvimTreeFocus<cr>
nnoremap <silent> - :NnnPicker %:p:h<cr>
nnoremap <silent> ` :NnnExplorer %:p:h<cr>

" ┌─┐┬┌┬┐
" │ ┬│ │
" └─┘┴ ┴

nmap <silent> <leader>gR :Gitsigns reset_buffer<cr>
nmap <silent> <leader>gS :Gitsigns stage_buffer<cr>
nmap <silent> <leader>gb :Gitsigns blame_line<cr>
nmap <leader>gc :FzfLua git_bcommits<cr>
nmap <silent> <leader>gdc :DiffviewClose<cr>
nmap <silent> <leader>gdf :DiffviewToggleFiles<cr>
nmap <silent> <leader>gdh :DiffviewFileHistory<cr>
nmap <silent> <leader>gdo :DiffviewOpen<cr>
nmap <silent> <leader>gdr :DiffviewRefresh<cr>
nmap <silent> <leader>gdt :Gitsigns diffthis<cr>
nmap <silent> <leader>ge :Tig<cr>
nmap <silent> <leader>gp :Gitsigns preview_hunk<cr>
nmap <silent> <leader>gq :Gitsigns setqflist<cr>:
nmap <silent> <leader>gr :Gitsigns reset_hunk<cr>
nmap <silent> <leader>gs :Gitsigns stage_hunk<cr>
nmap <silent> <leader>gts :Gitsigns toggle_signs<cr>
nmap <silent> <leader>gtd :Gitsigns toggle_deleted<cr>
nmap <silent> <leader>gtb :Gitsigns toggle_current_line_blame<cr>
nmap <silent> <leader>gtw :Gitsigns toggle_word_diff<cr>
nmap <silent> <leader>gtl :Gitsigns toggle_linehl<cr>
nmap <silent> <leader>gtn :Gitsigns toggle_numhl<cr>
nmap <silent> <leader>gu :Gitsigns undo_stage_hunk<cr>
nmap <silent> <leader>gv :Gitsigns select_hunk<cr>
nmap <silent> [h :Gitsigns prev_hunk<cr>
nmap <silent> ]h :Gitsigns next_hunk<cr>
nnoremap <silent> <C-G> :Git<cr>

" ┌─┐┌─┐┌─┐
" │  │ ││
" └─┘└─┘└─┘

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
