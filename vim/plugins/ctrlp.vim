
"  ██████╗████████╗██████╗ ██╗     ██████╗
" ██╔════╝╚══██╔══╝██╔══██╗██║     ██╔══██╗
" ██║        ██║   ██████╔╝██║     ██████╔╝
" ██║        ██║   ██╔══██╗██║     ██╔═══╝
" ╚██████╗   ██║   ██║  ██║███████╗██║
"  ╚═════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝

" @see https://github.com/ctrlpvim/ctrlp.vim

" Make sure to delete the cache after any change.
" Run `:CtrlPClearAllCaches` or delete the `.cache/ctrlp` in your home directory.

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Exclude files and directories
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
