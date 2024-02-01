
-- ███╗   ███╗ █████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗    ██╗███╗   ██╗
-- ████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔══██╗██╔═══██╗██║    ██║████╗  ██║
-- ██╔████╔██║███████║██████╔╝█████╔╝ ██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║
-- ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██║  ██║██║   ██║██║███╗██║██║╚██╗██║
-- ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝
-- https://github.com/preservim/vim-markdown

vim.g.vim_markdown_folding_disabled = 1 -- disable folding
vim.g.vim_markdown_frontmatter = 1 -- enable YAML frontmatter
vim.g.vim_markdown_follow_anchor = 1 -- follow anchor links
vim.g.vim_markdown_conceal = 0 -- disable concealing
vim.g.vim_markdown_conceal_code_blocks = 0 -- disable concealing fenced code blocks

-- Markdown fenced code block syntax highlighting
vim.g.vim_markdown_fenced_languages = {
  'bash=sh',
  'c',
  'c++=cpp',
  'markdown=md',
  'make=makefile',
  'go=golang',
  'sql',
  'java',
  'kotlin',
  'python',
  'ruby',
  'php',
  'typescript=ts',
  'javascript=js',
  'html',
  'json',
  'css',
  'yaml=yml',
  'toml'
}
