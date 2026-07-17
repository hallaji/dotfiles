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
    { "mason-org/mason-lspconfig.nvim", opts = {} },
  },
  config = function()
    vim.diagnostic.config({
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅙",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "󱤅",
        },
      },
      underline = true,
      virtual_text = false,
      virtual_lines = { current_line = true },
      float = {
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
        max_width = 80,
      },
    })
  end,
}
