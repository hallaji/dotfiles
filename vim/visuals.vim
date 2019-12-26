" ██╗   ██╗██╗███████╗██╗   ██╗ █████╗ ██╗     ███████╗
" ██║   ██║██║██╔════╝██║   ██║██╔══██╗██║     ██╔════╝
" ██║   ██║██║███████╗██║   ██║███████║██║     ███████╗
" ╚██╗ ██╔╝██║╚════██║██║   ██║██╔══██║██║     ╚════██║
"  ╚████╔╝ ██║███████║╚██████╔╝██║  ██║███████╗███████║
"   ╚═══╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝

colorscheme theme

"set t_Co=256                    "Use 256 colors. This is useful for terminal Vim.
"set guifont=Fira_Code:h14       "Font name and size
"set linespace=13            	  "Macvim-specific line-height.
"set nowrap
"set macligatures                "Pretty symbols when available.
"set guioptions-=e               "Disable Gui tabs

" Custom left padding for each window
set foldcolumn=1

set cursorline

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

set tabstop=4           " The width of a TAB is set to 4.
set shiftwidth=4        " Indents will have a width of 4
set softtabstop=4       " Sets the number of columns for a TAB
set expandtab           " Expand TABs to spaces

"autocmd Filetype html setlocal ts=2 sts=2 sw=2
"autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" Get correct comment highlighting in JSON files
autocmd FileType json syntax match Comment +\/\/.\+$+
