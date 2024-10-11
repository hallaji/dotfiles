-- ██╗    ██╗██╗  ██╗██╗ ██████╗██╗  ██╗    ██╗  ██╗███████╗██╗   ██╗
-- ██║    ██║██║  ██║██║██╔════╝██║  ██║    ██║ ██╔╝██╔════╝╚██╗ ██╔╝
-- ██║ █╗ ██║███████║██║██║     ███████║    █████╔╝ █████╗   ╚████╔╝
-- ██║███╗██║██╔══██║██║██║     ██╔══██║    ██╔═██╗ ██╔══╝    ╚██╔╝
-- ╚███╔███╔╝██║  ██║██║╚██████╗██║  ██║    ██║  ██╗███████╗   ██║
--  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚══════╝   ╚═╝
-- https://github.com/folke/which-key.nvim

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    print(os.getenv("PWD"))
    require("which-key").setup {
      win = {
        padding = { 1, 1 },  -- extra window padding [top/bottom, right/left]
        border = "single", -- none, single, double, shadow
      },
      icons = {
        group = "", -- symbol prepended to a group
      },
    }
  end,
}
