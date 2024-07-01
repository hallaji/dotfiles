
-- ███╗   ███╗██╗███╗   ██╗██╗
-- ████╗ ████║██║████╗  ██║██║
-- ██╔████╔██║██║██╔██╗ ██║██║
-- ██║╚██╔╝██║██║██║╚██╗██║██║
-- ██║ ╚═╝ ██║██║██║ ╚████║██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝
-- https://github.com/echasnovski/mini.nvim

return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    require("mini.trailspace").setup {
      -- Highlight only in normal buffers (ones with empty 'buftype'). This is
      -- useful to not show trailing whitespace where it usually doesn't matter.
      only_in_normal_buffers = true,
    }
  end,
}
