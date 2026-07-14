--  ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗
-- ██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝
-- ██║     ██║     ███████║██║   ██║██║  ██║█████╗
-- ██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝
-- ╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗
--  ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
-- https://github.com/coder/claudecode.nvim

return {
  "coder/claudecode.nvim",
  -- skip in vscode and in headless runs (e.g. dotup-vim) — the integration
  -- server is only useful with a UI attached
  cond = not vim.g.vscode and #vim.api.nvim_list_uis() > 0,
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = {
    -- Terminal Configuration
    terminal = {
      split_side = "right", -- "left" or "right"
      split_width_percentage = 0.40,
      provider = "external", -- "auto", "snacks", "native", "external", or custom provider table
      auto_close = true,

      -- Provider-specific options
      provider_opts = {
        -- Match the host terminal's launch syntax
        external_terminal_cmd = function(cmd)
          local cwd = vim.fn.getcwd()
          if vim.env.GHOSTTY_RESOURCES_DIR or vim.env.TERM_PROGRAM == "ghostty" then
            return string.format('ghostty --working-directory="%s" -e %s', cwd, cmd)
          end
          return string.format('alacritty --working-directory "%s" -e %s', cwd, cmd)
        end,
      },
    },
  },
}
