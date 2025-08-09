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
    { "mason-org/mason.nvim", opts = {}, },
    { "mason-org/mason-lspconfig.nvim", opts = {}, },
  },
}
