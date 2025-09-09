-- ████████╗███╗   ███╗██╗   ██╗██╗  ██╗██╗     ██╗███╗   ██╗███████╗
-- ╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝██║     ██║████╗  ██║██╔════╝
--    ██║   ██╔████╔██║██║   ██║ ╚███╔╝ ██║     ██║██╔██╗ ██║█████╗
--    ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗ ██║     ██║██║╚██╗██║██╔══╝
--    ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗███████╗██║██║ ╚████║███████╗
--    ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
-- https://github.com/edkolev/tmuxline.vim

return {
  "edkolev/tmuxline.vim",
  cond = not vim.g.vscode,
  config = function()
    vim.g.tmuxline_powerline_separators = 0

    vim.g.tmuxline_separators = { -- Use the following separators:
      left = "",
      left_alt = "",
      right = "",
      right_alt = "",
      space = " ",
    }

    vim.g.tmuxline_preset = { -- Use the following preset:
      a = {
        " #S",
      },
      b = {
        " #{?#{==:#{pane_current_command},nvim},#{@nvim_buffer_dir},#{b:pane_current_path}}",
      },
      c = {
        " #(tmux-session-ordinal)",
      },
      cwin = {
        "󰓩 #I #W",
      },
      win = {
        "󰓪 #I #W",
      },
      x = {
        "󰓩 #{window_index}/#{session_windows}",
        "#{?pane_in_mode, COPY, #P/#{window_panes}}",
      },
      y = {
        "󰋦 #(whoami)",
      },
      z = {
        " #{pane_current_command}",
      },
      options = {
        ["status-justify"] = "left", -- left, centre, or right
      },
    }

    local function setup_tmuxline_theme()
      local colorscheme = vim.g.colors_name
      if not colorscheme then
        return
      end

      -- Clear module cache to reload updated palettes
      package.loaded["palettes." .. colorscheme] = nil
      local ok, palette = pcall(require, "palettes." .. colorscheme)
      if not ok or not palette.status then
        return
      end

      local l = palette.status
      vim.g.tmuxline_theme = {
        a = { palette.base.primary_bg, l.tmux, "bold" },
        b = { l.section_b_fg, l.section_b_bg },
        c = { l.section_c_fg, palette.base.primary_bg },
        x = { l.section_c_fg, palette.base.primary_bg },
        y = { l.section_b_fg, l.section_b_bg },
        z = { palette.base.primary_bg, l.tmux, "bold" },
        win = { l.section_c_fg, l.section_c_bg },
        cwin = { palette.base.primary_bg, l.tab },
        bg = { l.section_b_bg, palette.base.primary_bg },
      }
    end

    setup_tmuxline_theme()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        -- Update tmuxline
        setup_tmuxline_theme()
        -- Update tmux statusline colors
        vim.cmd("Tmuxline")
        vim.cmd("TmuxlineSnapshot! ~/.tmux/statusline-colors.conf")
      end,
    })

    -- Update tmux status when buffer changes to show current directory
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      callback = function()
        if vim.env.TMUX then
          local current_file = vim.fn.expand("%:p")
          if current_file and current_file ~= "" then
            local buffer_dir = vim.fn.fnamemodify(current_file, ":h")
            local buffer_dirname = vim.fn.fnamemodify(buffer_dir, ":t")
            -- Set tmux user variable with the current buffer's directory name
            vim.fn.system("tmux set-option -g @nvim_buffer_dir '" .. buffer_dirname .. "'")
          end
          -- Regenerate tmux status line to pick up changes
          vim.cmd("Tmuxline")
        end
      end,
    })
  end,
}
