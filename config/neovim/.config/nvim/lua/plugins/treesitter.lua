-- ████████╗██████╗ ███████╗███████╗███████╗██╗████████╗████████╗███████╗██████╗
-- ╚══██╔══╝██╔══██╗██╔════╝██╔════╝██╔════╝██║╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗
--    ██║   ██████╔╝█████╗  █████╗  ███████╗██║   ██║      ██║   █████╗  ██████╔╝
--    ██║   ██╔══██╗██╔══╝  ██╔══╝  ╚════██║██║   ██║      ██║   ██╔══╝  ██╔══██╗
--    ██║   ██║  ██║███████╗███████╗███████║██║   ██║      ██║   ███████╗██║  ██║
--    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝
-- https://github.com/romus204/tree-sitter-manager.nvim
-- Parser/query manager for Neovim 0.12+ native treesitter (successor to the
-- archived nvim-treesitter); highlighting itself is started by vim.treesitter.

return {
  "romus204/tree-sitter-manager.nvim",
  cond = not vim.g.vscode,
  build = ":TSUpdate!", -- rebuild installed parsers when the plugin updates its pins
  opts = {
    -- Parsers to install on setup (pinned revisions, with matching queries)
    ensure_installed = {
      "bash",
      "c",
      "comment",
      "cpp",
      "css",
      "diff",
      "dockerfile",
      -- ensured (not auto-installed) because git commit/rebase editor sessions
      -- inherit a relative GIT_INDEX_FILE that breaks the parser install
      "git_rebase",
      "gitcommit",
      "go",
      "html",
      "java",
      "javascript",
      "kotlin",
      "lua",
      "php",
      "python",
      "query",
      "regex",
      "ruby",
      "sql",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },

    -- Install missing parsers when entering a buffer (needs the tree-sitter CLI)
    auto_install = true,

    -- Parsers to never auto-install (markdown/markdown_inline ship with Neovim)
    noauto_install = {
      "json",
      "jsdoc",
      "markdown",
      "markdown_inline",
    },

    -- Start native treesitter highlighting for buffers with an installed parser
    highlight = true,
  },
}
