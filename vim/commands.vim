
"  ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
" ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
" ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
" ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
" ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
"  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝

command! TrimWhiteSpaces call TrimWhiteSpaces()         " A command to trim whitespaces
command! ToggleRuler call ToggleRuler()                 " A command to toggle rulers
command! ToggleWrap call ToggleWrap()                   " A command to toggle wrapping

autocmd BufWritePre * :call TrimWhiteSpaces()           " Automatically trim before writing to the disk
autocmd FileType json syntax match Comment +\/\/.\+$+   " Get correct comment highlighting in JSON files

" Automatically source the vimrc file on save.
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

" Check if any buffers were changed outside of Vim
au CursorHold,CursorHoldI * checktime                   " Trigger when cursor stops moving
au FocusGained,BufEnter * checktime                     " Trigger when buffer changes
