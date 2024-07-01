" ███╗   ███╗ █████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗    ██╗███╗   ██╗
" ████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔══██╗██╔═══██╗██║    ██║████╗  ██║
" ██╔████╔██║███████║██████╔╝█████╔╝ ██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║
" ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██║  ██║██║   ██║██║███╗██║██║╚██╗██║
" ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║
" ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝
" https://github.com/preservim/vim-markdown

let g:vim_markdown_folding_disabled = 1 " disable folding
let g:vim_markdown_frontmatter = 1 " enable YAML frontmatter
let g:vim_markdown_follow_anchor = 1 " follow anchor links
let g:vim_markdown_conceal = 0 " disable concealing
let g:vim_markdown_conceal_code_blocks = 0 " disable concealing fenced code blocks

" Markdown fenced code block syntax highlighting
let g:vim_markdown_fenced_languages = [
  \ 'bash=sh',
  \ 'c',
  \ 'c++=cpp',
  \ 'markdown=md',
  \ 'make=makefile',
  \ 'go=golang',
  \ 'sql',
  \ 'java',
  \ 'kotlin',
  \ 'python',
  \ 'ruby',
  \ 'php',
  \ 'typescript=ts',
  \ 'javascript=js',
  \ 'html',
  \ 'json',
  \ 'css',
  \ 'yaml=yml',
  \ 'toml'
  \ ]
