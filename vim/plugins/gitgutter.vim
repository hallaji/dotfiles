
"  ██████╗ ██╗████████╗ ██████╗ ██╗   ██╗████████╗████████╗███████╗██████╗
" ██╔════╝ ██║╚══██╔══╝██╔════╝ ██║   ██║╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗
" ██║  ███╗██║   ██║   ██║  ███╗██║   ██║   ██║      ██║   █████╗  ██████╔╝
" ██║   ██║██║   ██║   ██║   ██║██║   ██║   ██║      ██║   ██╔══╝  ██╔══██╗
" ╚██████╔╝██║   ██║   ╚██████╔╝╚██████╔╝   ██║      ██║   ███████╗██║  ██║
"  ╚═════╝ ╚═╝   ╚═╝    ╚═════╝  ╚═════╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝

" @see https://github.com/airblade/vim-gitgutter

let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_close_preview_on_escape = 1

set foldtext=gitgutter#fold#foldtext()

function! GitGutterNextHunkCycle()
  let line = line('.')
  GitGutterNextHunk
  if line('.') == line
    1
    GitGutterNextHunk
  endif
endfunction

function! GitGutterPrevHunkCycle()
  let line = line('.')
  GitGutterPrevHunk
  if line('.') == line
    normal! G
    GitGutterPrevHunk
  endif
endfunction

function! GitGutterNextHunkAllBuffers()
  let line = line('.')
  GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      1
      GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! GitGutterPrevHunkAllBuffers()
  let line = line('.')
  GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      GitGutterPrevHunk
      return
    endif
  endwhile
endfunction
