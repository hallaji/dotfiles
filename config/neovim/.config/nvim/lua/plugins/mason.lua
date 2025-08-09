-- ███╗   ███╗ █████╗ ███████╗ ██████╗ ███╗   ██╗
-- ████╗ ████║██╔══██╗██╔════╝██╔═══██╗████╗  ██║
-- ██╔████╔██║███████║███████╗██║   ██║██╔██╗ ██║
-- ██║╚██╔╝██║██╔══██║╚════██║██║   ██║██║╚██╗██║
-- ██║ ╚═╝ ██║██║  ██║███████║╚██████╔╝██║ ╚████║
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝
-- https://github.com/mason-org/mason.nvim
-- https://github.com/mason-org/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig

return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
