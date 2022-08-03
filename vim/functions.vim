
" ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
" ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
" █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
" ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
" ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
" ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

" ┌─┐┌─┐┌┐┌┌─┐┬─┐┌─┐┬
" │ ┬├┤ │││├┤ ├┬┘├─┤│
" └─┘└─┘┘└┘└─┘┴└─┴ ┴┴─┘

" Setup command abbreviation
function! SetupCommandAbbrs (from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Trim trailing whitespaces
function! TrimWhiteSpaces()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction

" Toggle rulers in 80 and 120
function! ToggleRuler()
  execute "set colorcolumn=" . (&colorcolumn == "" ? "80,120" : "")
endfunction

" Toggle wrapping
function! ToggleWrap()
  execute "set wrap! wrap?"
endfunction

" ┌─┐┌─┐┌─┐
" │  │ ││
" └─┘└─┘└─┘

" Check backspace
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Show documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
