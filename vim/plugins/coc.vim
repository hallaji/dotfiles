
"  ██████╗ ██████╗  ██████╗
" ██╔════╝██╔═══██╗██╔════╝
" ██║     ██║   ██║██║
" ██║     ██║   ██║██║
" ╚██████╗╚██████╔╝╚██████╗
"  ╚═════╝ ╚═════╝  ╚═════╝

" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
" https://github.com/neoclide/coc.nvim/wiki/Language-servers

" List of COC extensions to install after starting the service
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-go',
  \ 'coc-java',
  \ 'coc-kotlin',
  \ 'coc-solargraph',
  \ 'coc-pyright',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-marketplace',
  \ 'coc-calc',
  \ 'coc-docker',
  \ 'coc-highlight',
  \ 'coc-markdownlint',
  \]

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
