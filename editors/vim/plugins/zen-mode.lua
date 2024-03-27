
-- ███████╗███████╗███╗   ██╗    ███╗   ███╗ ██████╗ ██████╗ ███████╗
-- ╚══███╔╝██╔════╝████╗  ██║    ████╗ ████║██╔═══██╗██╔══██╗██╔════╝
--   ███╔╝ █████╗  ██╔██╗ ██║    ██╔████╔██║██║   ██║██║  ██║█████╗
--  ███╔╝  ██╔══╝  ██║╚██╗██║    ██║╚██╔╝██║██║   ██║██║  ██║██╔══╝
-- ███████╗███████╗██║ ╚████║    ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████╗
-- ╚══════╝╚══════╝╚═╝  ╚═══╝    ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
-- https://github.com/folke/zen-mode.nvim

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
