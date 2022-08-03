
"  ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
" ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
" ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
" ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
" ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
"  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝

command! TrimWhiteSpaces call TrimWhiteSpaces() " A command to trim whitespaces
command! ToggleRuler call ToggleRuler() " A command to toggle rulers
command! ToggleWrap call ToggleWrap() " A command to toggle wrapping

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile') " A command to run prettier formatter

autocmd BufWritePre * :call TrimWhiteSpaces() " Automatically trim before writing to the disk
autocmd FileType json syntax match Comment +\/\/.\+$+ " Get correct comment highlighting in JSON files
autocmd BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded $NVIMRC" " Automatically source the vimrc file on save
autocmd CursorHold,CursorHoldI * checktime " Check if any buffers were changed outside of Vim and trigger when cursor stops moving
autocmd FocusGained,BufEnter * checktime " Check if any buffers were changed outside of Vim and trigger when buffer changes

" Startup commands
" autocmd VimEnter *
"   \   if !argc()
"   \ |   Startify
"   \ |   NERDTree
"   \ |   wincmd w
"   \ | endif
