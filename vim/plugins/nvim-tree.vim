" ███╗   ██╗██╗   ██╗██╗███╗   ███╗    ████████╗██████╗ ███████╗███████╗
" ████╗  ██║██║   ██║██║████╗ ████║    ╚══██╔══╝██╔══██╗██╔════╝██╔════╝
" ██╔██╗ ██║██║   ██║██║██╔████╔██║       ██║   ██████╔╝█████╗  █████╗
" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║       ██║   ██╔══██╗██╔══╝  ██╔══╝
" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║       ██║   ██║  ██║███████╗███████╗
" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝       ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝

" https://github.com/kyazdani42/nvim-tree.lua

lua << EOF
require("nvim-tree").setup({
  view = {
    width = 34,
  },
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "name", -- `none`, `icon`, `name` or `all`
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "󰿣",
          renamed = "󰰟",
          untracked = "󰓏",
          deleted = "ﮁ",
          ignored = "",
        }
      }
    }
  }
})
EOF
