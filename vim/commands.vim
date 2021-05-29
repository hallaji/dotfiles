"  ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
" ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
" ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
" ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
" ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
"  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝

command! TrimWhitespace call TrimWhitespace()           " Define a command for whitespace trimming

autocmd BufWritePre * :call TrimWhitespace()            " Automatically trim before writing to the disk
autocmd FileType json syntax match Comment +\/\/.\+$+   " Get correct comment highlighting in JSON files

augroup autosourcing                                    " Automatically source the vimrc file on save.
  autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

au CursorHold,CursorHoldI * checktime                   " Trigger when cursor stops moving
au FocusGained,BufEnter * checktime                     " Trigger when buffer changes
