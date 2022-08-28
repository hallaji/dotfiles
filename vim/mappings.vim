
" ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
" ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
" ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
" ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
" ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
" ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

" https://neovim.io/doc/user/map.html

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
nmap <leader><space> :nohlsearch<cr>
nmap <leader>m <Plug>MarkdownPreviewToggle
nmap <leader>t :call v:lua.MiniTrailspace.trim()<cr>
nmap <leader>z :ZenMode<cr>
nnoremap <C-X> :WhichKey<cr>
nnoremap <leader>e :set relativenumber!<cr>
nnoremap <leader>i :IndentLinesToggle<cr>
nnoremap <leader>l :Limelight!!<cr>
nnoremap <leader>n :set norelativenumber \| :set number!<cr>
nnoremap <leader>r :execute "set colorcolumn=" . (&colorcolumn == "" ? "80,120" : "")<cr>
nnoremap <leader>s :set spell! spelllang=en_au<cr>
nnoremap <leader>w :set wrap! wrap?<cr>

lua << EOF
  local wk = require("which-key")
  wk.register({
    Q = { "菱Replay macro recording" },
    Y = { " Yank (copy) to the line break" },
    ["<C-X>"] = { " Whichkey" },
  })
  wk.register({
    ["/"] = { " Comment" },
    p = { " Put (paste)" },
    y = { " Yank (copy)" },
  }, { mode="v", prefix = "<leader>" })
  wk.register({
    ["/"] = { " Comment" },
    ["<space>"] = { "Remove highlights" },
    e = { "陋Toggle relative numbers" },
    i = { " Toggle indent marks" },
    l = { "劉Toggle limelight mode" },
    m = { " Preview markdown" },
    n = { " Toggle numbers" },
    r = { " Toggle rulers" },
    s = { "暈Check spells (en_au)" },
    t = { " Trim spaces" },
    w = { "蝹Wrap" },
    z = { " Toggle zen mode" },
  }, { prefix = "<leader>" })
EOF

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

lua << EOF
  local wk = require("which-key")
  wk.register({
    ["<C-H>"] = { " Go to left window" },
    ["<C-J>"] = { " Go to down window" },
    ["<C-K>"] = { " Go to up window" },
    ["<C-L>"] = { " Go to right window" },
    ["<C-\\>"] = { " Previous window" },
    ["<C-Left>"] = { "ﲕ Resize width" },
    ["<C-Down>"] = { "ﲖ Resize height" },
    ["<C-Up>"] = { "ﲗ Resize height" },
    ["<C-Right>"] = { "ﲔ Resize width" },
    ["<Tab>"] = { "裡 Circle window forward" },
    ["<S-Tab>"] = { "裡 Circle window backward" },
    ["["] = {
      b = { " Prev buffer" },
      t = { " Prev tab" },
    },
    ["]"] = {
      b = { " Next buffer" },
      t = { " Next tab" },
    }
  })
EOF

lua << EOF
  local wk = require("which-key")
  wk.register({
    c = {
      name = " comment",
    },
  }, { prefix = "<leader>" })
EOF

" ┌┐ ┬ ┬┌─┐┌─┐┌─┐┬─┐
" ├┴┐│ │├┤ ├┤ ├┤ ├┬┘
" └─┘└─┘└  └  └─┘┴└─

inoremap <C-Q> <esc>:q<cr>
inoremap <C-S> <C-O>:update<cr>
nnoremap <C-Q> :q<cr>
nnoremap <C-S> :update<cr>
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>bQ :qa!<cr>
nnoremap <leader>bc :bd<cr>
nnoremap <leader>bf :bfirst<cr>
nnoremap <leader>bh :Startify<cr>
nnoremap <leader>bl :blast<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bq :q<cr>
nnoremap <leader>bs :update<cr>
vnoremap <C-Q> <esc>

lua << EOF
  local wk = require("which-key")
  wk.register({
    Q = { " Quit all" },
    b = {
      name = "﬘ buffer",
      Q = { " Quit all" },
      c = { " Close" },
      f = { " First" },
      h = { "ﳐ Home" },
      l = { " Last" },
      n = { " Next" },
      p = { " Previous" },
      q = { " Quit" },
      s = { " Save" },
    },
  }, { prefix = "<leader>" })
EOF

" ┌─┐┌─┐┌─┐┌┐┌
" │ │├─┘├┤ │││
" └─┘┴  └─┘┘└┘

" Edit my dotfiles in a new tab
nnoremap <silent> <leader>od :tabedit $DOTFILES<cr>

lua << EOF
  local wk = require("which-key")
  wk.register({
    o = {
      name = " open",
      d = { "Dotfiles" },
    },
  }, { prefix = "<leader>" })
EOF

" ┌─┐┬┌┐┌┌┬┐
" ├┤ ││││ ││
" └  ┴┘└┘─┴┘

inoremap <C-f> <esc>:FzfLua<cr>
nnoremap <C-f> :FzfLua<cr>
vnoremap <C-f> <esc>:FzfLua<cr>
nnoremap <leader>F <Plug>CtrlSFPrompt
nnoremap <leader>f :FzfLua<cr>
nnoremap <leader>fb :FzfLua buffers<cr>

lua << EOF
  local wk = require("which-key")
  wk.register({
    ["<C-F>"] = { " FZF" },
  })
  wk.register({
    f = {
      name = " find",
      b = { "﬘ Buffers" },
    },
  }, { prefix = "<leader>" })
EOF

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

lua << EOF
  local wk = require("which-key")
  wk.register({
    r = {
      name = " replace",
      c = { "Clear highlight" },
      f = { "Focus window" },
      l = { "Last search" },
      o = { "Open window" },
      p = { "Prompt" },
      s = { "Selected" },
      t = { "Toggle window" },
      u = { "Update last results" },
      w = { "Word" },
      z = { "Word plus boundary" },
    },
  }, { prefix = "<leader>" })
EOF

" ┌─┐─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐┬─┐
" ├┤ ┌┴┬┘├─┘│  │ │├┬┘├┤ ├┬┘
" └─┘┴ └─┴  ┴─┘└─┘┴└─└─┘┴└─

nnoremap <silent> _ :Explore<cr>
nnoremap <silent> ~ :NERDTreeFocus<cr>
nnoremap <silent> - :NnnPicker %:p:h<cr>
nnoremap <silent> ` :NnnExplorer<cr>

lua << EOF
  local wk = require("which-key")
  wk.register({
    ["_"] = { " Netrw" },
    ["~"] = { " NERDTree" },
    ["-"] = { " NNN Picker" },
    ["`"] = { " NNN Explorer" },
  })
EOF

" ┌─┐┬┌┬┐
" │ ┬│ │
" └─┘┴ ┴

nmap <silent> <leader>gR :Gitsigns reset_buffer<cr>
nmap <silent> <leader>gS :Gitsigns stage_buffer<cr>
nmap <silent> <leader>gb :Gitsigns blame_line<cr>
nmap <leader>gc :FzfLua git_bcommits<cr>
nmap <silent> <leader>gd :Gitsigns diffthis<cr>
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

lua << EOF
  local wk = require("which-key")
  wk.register({
    ["<C-G>"] = { " Fugitive" },
    ["["] = {
      h = { " Prev hunk (buffer)" },
    },
    ["]"] = {
      h = { " Next hunk (buffer)" },
    },
  })
  wk.register({
    g = {
      name = " git",
      R = { "﫧Reset (discard) buffer" },
      S = { " Stage buffer" },
      b = { " Blame" },
      c = { " Commits (buffer)" },
      d = { " Diff" },
      e = { " Explorer" },
      p = { " Preview hunk" },
      q = { " Quick fix (buffer)" },
      r = { "﫧Reset (discard) hunk" },
      s = { " Stage hunk" },
      t = {
        name = " Toggle",
        s = " Signs",
        d = " Deleted",
        b = " Blame",
        w = " Word diff",
        l = " Line highlight",
        n = " Number highlight",
      },
      u = { " Unstage hunk" },
      v = { "濾Select hunk" },
    },
  }, { prefix = "<leader>" })
EOF

" ┌─┐┌─┐┌─┐
" ├┤ ┌─┘├┤
" └  └─┘└

" @TODO: fzf mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

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

lua << EOF
  local wk = require("which-key")
  wk.register({
    ["[g"] = { " Prev diagnostic" },
    ["]g"] = { " Next diagnostic" },
    g = {
      d = { " Definition" },
      y = { " Type definition" },
      i = { " Implementation" },
      r = { " Reference" },
    },
  })
EOF

" Insert <tab> when previous text is space, refresh completion if not
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<cr>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" @FIXME: C-s is in use, choose another key
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<cr>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<cr>
