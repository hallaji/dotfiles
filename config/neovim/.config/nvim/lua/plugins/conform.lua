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
    format_on_save = function(bufnr)
      -- Allow disabling per-buffer (:lua vim.b[0].disable_autoformat = true) or globally.
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      ruby = { "rubocop" },
      kotlin = { "ktlint" },
      c = { "clang_format" },
      cpp = { "clang_format" },
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
