-- ███╗   ██╗ ██████╗ ██╗ ██████╗███████╗
-- ████╗  ██║██╔═══██╗██║██╔════╝██╔════╝
-- ██╔██╗ ██║██║   ██║██║██║     █████╗
-- ██║╚██╗██║██║   ██║██║██║     ██╔══╝
-- ██║ ╚████║╚██████╔╝██║╚██████╗███████╗
-- ╚═╝  ╚═══╝ ╚═════╝ ╚═╝ ╚═════╝╚══════╝
-- https://github.com/folke/noice.nvim

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
  }
}
