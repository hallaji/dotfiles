
" ███████╗████████╗ █████╗ ██████╗ ████████╗██╗███████╗██╗   ██╗
" ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██║██╔════╝╚██╗ ██╔╝
" ███████╗   ██║   ███████║██████╔╝   ██║   ██║█████╗   ╚████╔╝
" ╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ██║██╔══╝    ╚██╔╝
" ███████║   ██║   ██║  ██║██║  ██║   ██║   ██║██║        ██║
" ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝        ╚═╝

" https://github.com/mhinz/vim-startify
" https://github.com/mhinz/vim-startify/blob/master/doc/startify.txt

" Use unicode box-drawing characters
let g:startify_fortune_use_unicode = 1

" Returns all modified files of the current git repo
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_bookmarks = [ {'d': "$DOTFILES"} ]
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
  \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
  \ ]
