--  ██████╗ ██████╗ ███╗   ██╗███████╗ ██████╗ ██████╗ ███╗   ███╗
-- ██╔════╝██╔═══██╗████╗  ██║██╔════╝██╔═══██╗██╔══██╗████╗ ████║
-- ██║     ██║   ██║██╔██╗ ██║█████╗  ██║   ██║██████╔╝██╔████╔██║
-- ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║
-- ╚██████╗╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║
--  ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝
-- https://github.com/stevearc/conform.nvim

return {
  "stevearc/conform.nvim",
  cond = not vim.g.vscode,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      ruby = { "rubocop" },
      kotlin = { "ktlint" },
      -- prettier-backed web filetypes
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
    },
  },
}
