" ██╗   ██╗██╗███╗   ███╗       ██████╗  ██████╗
" ██║   ██║██║████╗ ████║      ██╔════╝ ██╔═══██╗
" ██║   ██║██║██╔████╔██║█████╗██║  ███╗██║   ██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██║   ██║██║   ██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║      ╚██████╔╝╚██████╔╝
"   ╚═══╝  ╚═╝╚═╝     ╚═╝       ╚═════╝  ╚═════╝
" https://github.com/fatih/vim-go

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_sameids = 1                       " Highlight same variables
let g:go_def_mapping_enabled = 1
let g:go_fmt_command = "goimports"              " Auto import dependencies
let g:go_def_mode='gopls'                       " Go language server
let g:go_info_mode='gopls'                      " Go language server
