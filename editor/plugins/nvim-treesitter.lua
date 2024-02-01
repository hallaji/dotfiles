
-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██║   ██║██║████╗ ████║
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
-- ████████╗██████╗ ███████╗███████╗███████╗██╗████████╗████████╗███████╗██████╗
-- ╚══██╔══╝██╔══██╗██╔════╝██╔════╝██╔════╝██║╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗
--    ██║   ██████╔╝█████╗  █████╗  ███████╗██║   ██║      ██║   █████╗  ██████╔╝
--    ██║   ██╔══██╗██╔══╝  ██╔══╝  ╚════██║██║   ██║      ██║   ██╔══╝  ██╔══██╗
--    ██║   ██║  ██║███████╗███████╗███████║██║   ██║      ██║   ███████╗██║  ██║
--    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝
-- https://github.com/nvim-treesitter/nvim-treesitter

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "bash",
    "c",
    "comment",
    "cpp",
    "css",
    "diff",
    "dockerfile",
    "go",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "kotlin",
    "lua",
    "php",
    "python",
    "query",
    "ruby",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {
    "markdown",
    "markdown_inline",
  },

  highlight = {
    enable = true,
  },
}
