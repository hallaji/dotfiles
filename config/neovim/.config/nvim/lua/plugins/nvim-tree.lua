-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗    ████████╗██████╗ ███████╗███████╗
-- ████╗  ██║██║   ██║██║████╗ ████║    ╚══██╔══╝██╔══██╗██╔════╝██╔════╝
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║       ██║   ██████╔╝█████╗  █████╗
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║       ██║   ██╔══██╗██╔══╝  ██╔══╝
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║       ██║   ██║  ██║███████╗███████╗
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝       ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
-- https://github.com/kyazdani42/nvim-tree.lua

return {
  "kyazdani42/nvim-tree.lua",
  cond = not vim.g.vscode,
  config = function()
    require("nvim-tree").setup({
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local width = math.floor(screen_w * 0.8)
            local height = math.floor(screen_h * 0.7)
            return {
              border = "rounded",
              relative = "editor",
              width = width,
              height = height,
              row = math.floor((screen_h - height) / 2),
              col = math.floor((screen_w - width) / 2),
            }
          end,
        },
      },
      actions = {
        open_file = {
          quit_on_open = true, -- don't leave the float hovering over the opened file
        },
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
              deleted = "󰚃",
              ignored = "",
            },
          },
        },
      },
    })
  end,
}
