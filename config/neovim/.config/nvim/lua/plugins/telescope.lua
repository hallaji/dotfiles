-- ████████╗███████╗██╗     ███████╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗
-- ╚══██╔══╝██╔════╝██║     ██╔════╝██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝
--    ██║   █████╗  ██║     █████╗  ███████╗██║     ██║   ██║██████╔╝█████╗
--    ██║   ██╔══╝  ██║     ██╔══╝  ╚════██║██║     ██║   ██║██╔═══╝ ██╔══╝
--    ██║   ███████╗███████╗███████╗███████║╚██████╗╚██████╔╝██║     ███████╗
--    ╚═╝   ╚══════╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚══════╝
-- https://github.com/nvim-telescope/telescope.nvim

return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    cond = not vim.g.vscode,
  },
  {
    "nvim-telescope/telescope.nvim",
    cond = not vim.g.vscode,
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
