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
  config = function(_, opts)
    require("claudecode").setup(opts)

    -- On diff open: drop the redundant original-file split (the unified buffer
    -- already shows both sides) so the diff fills its tab, and raise Neovim's window.
    vim.api.nvim_create_autocmd("User", {
      pattern = "ClaudeCodeDiffOpened",
      group = vim.api.nvim_create_augroup("ClaudeCodeFocus", { clear = true }),
      callback = function(ev)
        local win = ev.data and ev.data.diff_window
        if win and vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_set_current_win(win)
          vim.cmd("only")
        end

        local ghostty = vim.env.GHOSTTY_RESOURCES_DIR or vim.env.TERM_PROGRAM == "ghostty"
        if vim.fn.has("mac") == 1 then
          vim.system({ "open", "-a", ghostty and "Ghostty" or "Alacritty" })
        else
          local class = ghostty and "com.mitchellh.ghostty" or "Alacritty"
          vim.system({ "hyprctl", "dispatch", "focuswindow", "class:" .. class })
        end
      end,
    })
  end,
  opts = {
    -- Review changes as a single unified diff in its own tab (the redundant
    -- original-file split is dropped by the ClaudeCodeDiffOpened handler above).
    diff_opts = {
      layout = "unified",
      open_in_new_tab = true,
    },

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
