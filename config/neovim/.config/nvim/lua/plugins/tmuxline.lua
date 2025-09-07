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
      left = "",
      left_alt = "",
      right = "",
      right_alt = "",
      space = " ",
    }

    vim.g.tmuxline_preset = { -- Use the following preset:
      a = {
        " #S",
      },
      b = {
        " #(tmux-session-ordinal)",
      },
      c = {
        "󰓩 #I#(tmux list-windows | wc -l | tr -d ' ')",
      },
      cwin = {
        "󰓩 #I #W",
      },
      win = {
        "󰓪 #I #W",
      },
      x = {
        "#(quote)",
      },
      y = {
        "#{?pane_in_mode, COPY, #P#{window_panes}}",
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
        win = { l.section_c_fg, palette.base.primary_bg },
        cwin = { palette.base.primary_bg, l.tab, "bold" },
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
  end,
}
