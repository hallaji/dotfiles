-- ███╗   ███╗ █████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗    ██╗███╗   ██╗
-- ████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔══██╗██╔═══██╗██║    ██║████╗  ██║
-- ██╔████╔██║███████║██████╔╝█████╔╝ ██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║
-- ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██║  ██║██║   ██║██║███╗██║██║╚██╗██║
-- ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝
-- https://github.com/preservim/vim-markdown
-- https://github.com/MeanderingProgrammer/render-markdown.nvim

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    cond = not vim.g.vscode,
    ft = { "markdown" },
    dependencies = { "nvim-mini/mini.nvim" },
    opts = {
      latex = { enabled = false }, -- needs a latex treesitter parser + utftex/latex2text, none installed
    },
  },
  {
    "preservim/vim-markdown",
    cond = not vim.g.vscode,
    config = function()
      vim.g.vim_markdown_folding_disabled = 1 -- disable folding
      vim.g.vim_markdown_frontmatter = 1 -- enable YAML frontmatter
      vim.g.vim_markdown_follow_anchor = 1 -- follow anchor links
      vim.g.vim_markdown_conceal = 0 -- disable concealing
      vim.g.vim_markdown_conceal_code_blocks = 0 -- disable concealing fenced code blocks
      vim.g.vim_markdown_fenced_languages = { -- Markdown fenced code block syntax highlighting
        "bash=sh",
        "c",
        "c++=cpp",
        "markdown=md",
        "make=makefile",
        "go=golang",
        "sql",
        "java",
        "kotlin",
        "python",
        "ruby",
        "php",
        "typescript=ts",
        "javascript=js",
        "html",
        "json",
        "css",
        "yaml=yml",
        "toml",
      }
    end,
  },
}
