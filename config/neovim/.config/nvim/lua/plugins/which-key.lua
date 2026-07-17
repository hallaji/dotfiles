-- ██╗    ██╗██╗  ██╗██╗ ██████╗██╗  ██╗    ██╗  ██╗███████╗██╗   ██╗
-- ██║    ██║██║  ██║██║██╔════╝██║  ██║    ██║ ██╔╝██╔════╝╚██╗ ██╔╝
-- ██║ █╗ ██║███████║██║██║     ███████║    █████╔╝ █████╗   ╚████╔╝
-- ██║███╗██║██╔══██║██║██║     ██╔══██║    ██╔═██╗ ██╔══╝    ╚██╔╝
-- ╚███╔███╔╝██║  ██║██║╚██████╗██║  ██║    ██║  ██╗███████╗   ██║
--  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚══════╝   ╚═╝
-- https://github.com/folke/which-key.nvim

return {
  "folke/which-key.nvim",
  cond = not vim.g.vscode,
  event = "VeryLazy",
  opts = {},
  config = function()
    require("which-key").setup({
      win = {
        padding = { 1, 1 }, -- extra window padding [top/bottom, right/left]
        border = "single", -- none, single, double, shadow
      },
      icons = {
        group = "", -- symbol prepended to a group
      },
      -- Inside a Claude Code diff buffer, show only the buffer-local review
      -- keys (,y accept / ,n deny) instead of merging in the full leader menu.
      filter = function(mapping)
        if vim.b.claudecode_inline_diff then
          return (mapping.buffer or 0) ~= 0
        end
        return true
      end,
    })
  end,
}
