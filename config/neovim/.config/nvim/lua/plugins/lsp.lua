-- ██╗     ███████╗██████╗
-- ██║     ██╔════╝██╔══██╗
-- ██║     ███████╗██████╔╝
-- ██║     ╚════██║██╔═══╝
-- ███████╗███████║██║
-- ╚══════╝╚══════╝╚═╝
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/mason-org/mason.nvim
-- https://github.com/mason-org/mason-lspconfig.nvim

return {
  "neovim/nvim-lspconfig",
  cond = not vim.g.vscode,
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "bashls",
          "gopls",
          "kotlin_language_server",
          "lua_ls",
          "pylsp",
          "rubocop",
          "solargraph",
          "tailwindcss",
          "ts_ls",
        },
        -- formatters and linters
        -- "black",
        -- "eslint_d",
        -- "ktlint",
        -- "prettier",
        -- "stylua",
      },
    },
  },
}
