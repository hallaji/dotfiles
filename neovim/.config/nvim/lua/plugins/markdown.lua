
-- ███╗   ███╗ █████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗    ██╗███╗   ██╗
-- ████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔══██╗██╔═══██╗██║    ██║████╗  ██║
-- ██╔████╔██║███████║██████╔╝█████╔╝ ██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║
-- ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██║  ██║██║   ██║██║███╗██║██║╚██╗██║
-- ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝
-- https://github.com/preservim/vim-markdown
-- https://github.com/iamcco/markdown-preview.nvim

return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_auto_start = 0 -- Don't automatically open the preview window
      vim.g.mkdp_auto_close = 0 -- Don't automatically close the preview window when the buffer is closed
      vim.g.mkdp_command_for_global = 0 -- Don't map <Plug>MarkdownPreview to <Leader>mp
    end,
  },
  {
    "preservim/vim-markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1 -- disable folding
      vim.g.vim_markdown_frontmatter = 1 -- enable YAML frontmatter
      vim.g.vim_markdown_follow_anchor = 1 -- follow anchor links
      vim.g.vim_markdown_conceal = 0 -- disable concealing
      vim.g.vim_markdown_conceal_code_blocks = 0 -- disable concealing fenced code blocks
      vim.g.vim_markdown_fenced_languages = { -- Markdown fenced code block syntax highlighting
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
    end,
  },
}
