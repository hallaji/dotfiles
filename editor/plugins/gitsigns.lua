
--  ██████╗ ██╗████████╗███████╗██╗ ██████╗ ███╗   ██╗███████╗
-- ██╔════╝ ██║╚══██╔══╝██╔════╝██║██╔════╝ ████╗  ██║██╔════╝
-- ██║  ███╗██║   ██║   ███████╗██║██║  ███╗██╔██╗ ██║███████╗
-- ██║   ██║██║   ██║   ╚════██║██║██║   ██║██║╚██╗██║╚════██║
-- ╚██████╔╝██║   ██║   ███████║██║╚██████╔╝██║ ╚████║███████║
--  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
-- https://github.com/lewis6991/gitsigns.nvim

require('gitsigns').setup {
  signs = {
    add          = { text = '' },
    change       = { text = '' },
    delete       = { text = '﹏' },
    topdelete    = { text = '﹋' },
    changedelete = { text = '〰' },
    untracked    = { text = '┆' },
  },
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_formatter = '    (<author>, <author_time:%R>) <summary>',
  yadm = {
    enable = false
  },
}
