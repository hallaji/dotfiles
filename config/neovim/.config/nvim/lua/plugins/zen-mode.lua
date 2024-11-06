-- ███████╗███████╗███╗   ██╗    ███╗   ███╗ ██████╗ ██████╗ ███████╗
-- ╚══███╔╝██╔════╝████╗  ██║    ████╗ ████║██╔═══██╗██╔══██╗██╔════╝
--   ███╔╝ █████╗  ██╔██╗ ██║    ██╔████╔██║██║   ██║██║  ██║█████╗
--  ███╔╝  ██╔══╝  ██║╚██╗██║    ██║╚██╔╝██║██║   ██║██║  ██║██╔══╝
-- ███████╗███████╗██║ ╚████║    ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████╗
-- ╚══════╝╚══════╝╚═╝  ╚═══╝    ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
-- https://github.com/folke/zen-mode.nvim

return {
  "folke/zen-mode.nvim",
  cond = not vim.g.vscode,
  config = function()
    require("zen-mode").setup {
      window = {
        options = {
          relativenumber = false,
        },
      },
      plugins = {
        options = {
          laststatus = 0,
        },
        tmux = {
          enabled = true,
        },
      },
    }
  end,
}
