--  ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗
-- ██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝
-- ██║     ██║     ███████║██║   ██║██║  ██║█████╗
-- ██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝
-- ╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗
--  ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
-- https://github.com/coder/claudecode.nvim

return {
  "coder/claudecode.nvim",
  cond = not vim.g.vscode,
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = {
    -- Terminal Configuration
    terminal = {
      split_side = "right", -- "left" or "right"
      split_width_percentage = 0.40,
      provider = "auto",    -- "auto", "snacks", "native", "external", or custom provider table
      auto_close = true,

      -- Provider-specific options
      provider_opts = {
        external_terminal_cmd = "alacritty -e %s",
      },
    },
  },
}
