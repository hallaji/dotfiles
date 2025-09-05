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
      a = { " #S" },
      b = { "󰓩 #I#(tmux list-windows | wc -l | tr -d ' ')" },
      c = { " #{pane_current_command}" },
      cwin = { "󰓩 #I #W" },
      win = { "󰓪 #I #W" },
      x = { "#(quote)" },
      y = { " #P#{window_panes}" },
      z = { " #W" },
      options = { ["status-justify"] = "left" }, -- left, centre, or right
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
        c = { l.section_c_fg, l.section_c_bg },
        x = { l.section_c_fg, l.section_c_bg },
        y = { l.section_b_fg, l.section_b_bg },
        z = { palette.base.primary_bg, l.tmux, "bold" },
        win = { l.section_c_fg, l.section_c_bg },
        cwin = { l.section_b_fg, l.section_c_bg, "bold" },
        bg = { l.section_b_bg, l.section_c_bg },
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
