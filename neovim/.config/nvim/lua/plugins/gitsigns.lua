
--  ██████╗ ██╗████████╗███████╗██╗ ██████╗ ███╗   ██╗███████╗
-- ██╔════╝ ██║╚══██╔══╝██╔════╝██║██╔════╝ ████╗  ██║██╔════╝
-- ██║  ███╗██║   ██║   ███████╗██║██║  ███╗██╔██╗ ██║███████╗
-- ██║   ██║██║   ██║   ╚════██║██║██║   ██║██║╚██╗██║╚════██║
-- ╚██████╔╝██║   ██║   ███████║██║╚██████╔╝██║ ╚████║███████║
--  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
-- https://github.com/lewis6991/gitsigns.nvim

return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup {
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_formatter = '    (<author>, <author_time:%R>) <summary>',
    }
  end,
}
