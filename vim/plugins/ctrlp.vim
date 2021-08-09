
"  ██████╗████████╗██████╗ ██╗     ██████╗
" ██╔════╝╚══██╔══╝██╔══██╗██║     ██╔══██╗
" ██║        ██║   ██████╔╝██║     ██████╔╝
" ██║        ██║   ██╔══██╗██║     ██╔═══╝
" ╚██████╗   ██║   ██║  ██║███████╗██║
"  ╚═════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝

" @see https://github.com/ctrlpvim/ctrlp.vim

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Exclude files and directories
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" Enable extensions
 let g:ctrlp_extensions = ['tag', 'dir', 'line', 'changes', 'mixed']
