-- ███████╗███╗   ██╗ █████╗  ██████╗██╗  ██╗███████╗
-- ██╔════╝████╗  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝
-- ███████╗██╔██╗ ██║███████║██║     █████╔╝ ███████╗
-- ╚════██║██║╚██╗██║██╔══██║██║     ██╔═██╗ ╚════██║
-- ███████║██║ ╚████║██║  ██║╚██████╗██║  ██╗███████║
-- ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝
-- https://github.com/folke/snacks.nvim

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = { enabled = false },
    notifier = {
      enabled = true, -- replaces vim.notify; noice routes its notify view here
      timeout = 4000, -- ms before a notification auto-hides
      top_down = true, -- newest notification at the top
      style = "compact", -- "compact" | "fancy" | "minimal"
    },
    terminal = {
      win = { style = "terminal" },
    },
    indent = {
      indent = {
        priority = 1,
        enabled = true, -- enable indent guides
        char = "",
        only_scope = false, -- only show indent guides of the scope
        only_current = false, -- only show indent guides in the current window
        hl = "SnacksIndent",
      },
      animate = {
        enabled = vim.fn.has("nvim-0.10") == 1,
        style = "out",
        easing = "linear",
        duration = {
          step = 20, -- ms per step
          total = 500, -- maximum duration
        },
      },
      scope = {
        enabled = true, -- enable highlighting the current scope
        priority = 200,
        char = "",
        underline = false, -- underline the start of the scope
        only_current = false, -- only show scope in the current window
        hl = "SnacksIndentScope",
      },
      chunk = {
        -- when enabled, scopes will be rendered as chunks, except for the
        -- top-level scope which will be rendered as a scope.
        enabled = true,
        -- only show chunk scopes in the current window
        only_current = false,
        priority = 200,
        hl = "SnacksIndentChunk",
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
          horizontal = "",
          vertical = "",
          arrow = "",
        },
      },
      -- filter for buffers to enable indent guides
      filter = function(buf)
        return vim.g.snacks_indent ~= false
          and vim.b[buf].snacks_indent ~= false
          and vim.bo[buf].buftype == ""
      end,
    },
  },
}
