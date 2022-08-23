
"  ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
" ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
" ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
" ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
" ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
"  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝

" ┌─┐┌─┐┌┐┌┌─┐┬─┐┌─┐┬
" │ ┬├┤ │││├┤ ├┬┘├─┤│
" └─┘└─┘┘└┘└─┘┴└─┴ ┴┴─┘

command! TrimWhiteSpaces call TrimWhiteSpaces() " A command to trim whitespaces
command! ToggleRuler call ToggleRuler() " A command to toggle rulers
command! ToggleWrap call ToggleWrap() " A command to toggle wrapping

autocmd BufWritePre * :call TrimWhiteSpaces() " Automatically trim before writing to the disk
autocmd BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded $NVIMRC" " Automatically source the vimrc file on save
autocmd CursorHold,CursorHoldI * checktime " Check if any buffers were changed outside of Vim and trigger when cursor stops moving
autocmd FocusGained,BufEnter * checktime " Check if any buffers were changed outside of Vim and trigger when buffer changes

" ┌─┐┌─┐┌─┐
" │  │ ││
" └─┘└─┘└─┘

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile') " A command to run prettier formatter

" ┌─┐┬ ┬┌┐┌┌┬┐┌─┐─┐ ┬
" └─┐└┬┘│││ │ ├─┤┌┴┬┘
" └─┘ ┴ ┘└┘ ┴ ┴ ┴┴ └─

autocmd BufNewFile,BufRead .env* set syntax=sh " Set `shell` syntax for env files
autocmd BufNewFile,BufRead *.example set filetype=conf " Set `conf` file type for example files
autocmd BufNewFile,BufRead freshrc set syntax=sh " Set `shell` syntax for freshrc file
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | endif " Set shell syntax if any file has no extension
autocmd BufNewFile,BufRead COMMIT_EDITMSG set syntax=gitcommit " Set `gitcommit` syntax for git commit message
autocmd FileType gitcommit setlocal spell spelllang=en_au " Enable spell check in git commit message

" ┌─┐┌┬┐┌─┐┬─┐┌┬┐┬ ┬┌─┐
" └─┐ │ ├─┤├┬┘ │ │ │├─┘
" └─┘ ┴ ┴ ┴┴└─ ┴ └─┘┴

" autocmd VimEnter *
"   \   if !argc()
"   \ |   Startify
"   \ |   NERDTree
"   \ |   wincmd w
"   \ | endif
