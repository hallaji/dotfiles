-- ██╗      █████╗ ███████╗██╗   ██╗██████╗ ███████╗██╗   ██╗
-- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██╔══██╗██╔════╝██║   ██║
-- ██║     ███████║  ███╔╝  ╚████╔╝ ██║  ██║█████╗  ██║   ██║
-- ██║     ██╔══██║ ███╔╝    ╚██╔╝  ██║  ██║██╔══╝  ╚██╗ ██╔╝
-- ███████╗██║  ██║███████╗   ██║   ██████╔╝███████╗ ╚████╔╝
-- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚══════╝  ╚═══╝
-- https://github.com/folke/lazydev.nvim

return {
  "folke/lazydev.nvim",
  cond = not vim.g.vscode,
  ft = "lua", -- Load only for Lua files
  opts = {
    library = {
      -- Load luvit types when the `vim.uv` word is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}
