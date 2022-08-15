
" ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
" ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
" ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
" ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
" ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
" ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

" https://neovim.io/doc/user/map.html

let mapleader = ',' " If not set or empty, a backslash is used instead.

" ┌─┐┌─┐┌┐┌┌─┐┬─┐┌─┐┬
" │ ┬├┤ │││├┤ ├┬┘├─┤│
" └─┘└─┘┘└┘└─┘┴└─┴ ┴┴─┘

" Edit my dotfiles in a new tab
nnoremap <silent> <leader>dot :tabedit $DOTFILES<cr>

" Make Y behave like other capitals
nnoremap Y y$

" Replay macro recording with Q
nnoremap Q @q

" Remove search highlights
nmap <leader><space> :nohlsearch<cr>

" Comment a line
map <leader>/ :Commentary<cr>

" Trim the trailing whitespaces
nmap <leader>z :TrimWhiteSpaces<cr>

" Toggle the ruler
nnoremap <leader>r :ToggleRuler<cr>

" Toggle wrapping
nnoremap <leader>w :ToggleWrap<cr>

" Neovim support showing relative number
nnoremap <leader>n :set relativenumber!<cr>

" Toggle spell checker
nnoremap <leader>S :set spell! spelllang=en_au<cr>

" Copy/paste from/to system clipboard in visual/select mode
vnoremap <leader>y "*y
vnoremap <leader>p "*p

" Re-copy selected area on paste operation (vim paste has no memory)
xnoremap p pgvy

" Use <C-n>i to send <C-i> because <C-i> is same as <tab> when received by vim
" Check Alacritty bindings for <C-i>
nnoremap <C-n>i <C-i>

" ┌┐┌┌─┐┬  ┬┬┌─┐┌─┐┌┬┐┬┌─┐┌┐┌
" │││├─┤└┐┌┘││ ┬├─┤ │ ││ ││││
" ┘└┘┴ ┴ └┘ ┴└─┘┴ ┴ ┴ ┴└─┘┘└┘

" Jump between splits
nnoremap <C-h> <C-W><C-H>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>

" Resize splits
nnoremap <C-Left> <C-W><
nnoremap <C-Down> <C-W>-
nnoremap <C-Up> <C-W>+
nnoremap <C-Right> <C-W>>

" Circle windows (splits)
nnoremap <tab>   <C-w>w
nnoremap <S-tab> <C-w>W

" Circle buffers
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" Circle tabs
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" Circle hunks in a buffer
nnoremap <silent> ]h :call GitGutterNextHunkCycle()<cr>
nnoremap <silent> [h :call GitGutterPrevHunkCycle()<cr>

" Circle hunks in all buffers
nnoremap <silent> ]c :call GitGutterNextHunkAllBuffers()<cr>
nnoremap <silent> [c :call GitGutterPrevHunkAllBuffers()<cr>

" ┌─┐┌─┐┬  ┬┌─┐
" └─┐├─┤└┐┌┘├┤
" └─┘┴ ┴ └┘ └─┘

" @FIXME There's a conflict with COC
inoremap <C-s> <C-O>:update<cr>
nnoremap <C-s> :update<cr>
nnoremap <leader>s :update<cr>

" ┌─┐ ┬ ┬┬┌┬┐
" │─┼┐│ ││ │
" └─┘└└─┘┴ ┴

inoremap <C-q> <esc>:q<cr>
nnoremap <C-q> :q<cr>
vnoremap <C-q> <esc>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>

" @TODO: add ,f to search
" ┌┐┌┌─┐┌┬┐┬─┐┬ ┬
" │││├┤  │ ├┬┘│││
" ┘└┘└─┘ ┴ ┴└─└┴┘

nnoremap <silent> _ :Explore<cr>

" ┌┐┌┌─┐┬─┐┌┬┐┌┬┐┬─┐┌─┐┌─┐
" │││├┤ ├┬┘ ││ │ ├┬┘├┤ ├┤
" ┘└┘└─┘┴└──┴┘ ┴ ┴└─└─┘└─┘

nnoremap <silent> ~ :NERDTreeFocus<cr>

" ┌┐┌┌┐┌┌┐┌
" │││││││││
" ┘└┘┘└┘┘└┘

nnoremap <silent> - :NnnPicker %:p:h<CR>
nnoremap <silent> ` :NnnExplorer<CR>

" ┌┬┐┌─┐┬─┐┬┌─┌┬┐┌─┐┬ ┬┌┐┌
" │││├─┤├┬┘├┴┐ │││ │││││││
" ┴ ┴┴ ┴┴└─┴ ┴─┴┘└─┘└┴┘┘└┘

nmap <leader>m <Plug>MarkdownPreviewToggle

" ┌─┐┬ ┬┌─┐┬┌┬┐┬┬  ┬┌─┐
" ├┤ │ ││ ┬│ │ │└┐┌┘├┤
" └  └─┘└─┘┴ ┴ ┴ └┘ └─┘

nnoremap <C-g> :Git<cr>
nnoremap <leader>g :Git<cr>

" ┌─┐┬┌┬┐┌─┐┬ ┬┌┬┐┌┬┐┌─┐┬─┐
" │ ┬│ │ │ ┬│ │ │  │ ├┤ ├┬┘
" └─┘┴ ┴ └─┘└─┘ ┴  ┴ └─┘┴└─

nmap <leader>gp <Plug>(GitGutterPreviewHunk)
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gd <Plug>(GitGutterUndoHunk)
nmap <leader>gf <Plug>(GitGutterFold)

" ┌─┐┌─┐┌─┐
" ├┤ ┌─┘├┤
" └  └─┘└

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>bf :Files<cr>
nnoremap <leader>bg :GFiles?<cr>
nnoremap <leader>bt :Tags<cr>
nnoremap <leader>bw :Windows<cr>
nnoremap <leader>bc :Commands<cr>
nnoremap <leader>bh :History:<cr>
nnoremap <leader>bs :Snippets<cr>
nnoremap <leader>bg :GV<cr>
nnoremap <leader>bgc :GV!<cr>
nnoremap <leader>bgr :GV?<cr>

" ┌─┐┌─┐┌─┐
" │  │ ││
" └─┘└─┘└─┘

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
nmap <leader>qf  <Plug>(coc-fix-current)

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
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

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
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
