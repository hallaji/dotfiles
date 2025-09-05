-- ██╗     ██╗   ██╗ █████╗ ██╗     ██╗███╗   ██╗███████╗
-- ██║     ██║   ██║██╔══██╗██║     ██║████╗  ██║██╔════╝
-- ██║     ██║   ██║███████║██║     ██║██╔██╗ ██║█████╗
-- ██║     ██║   ██║██╔══██║██║     ██║██║╚██╗██║██╔══╝
-- ███████╗╚██████╔╝██║  ██║███████╗██║██║ ╚████║███████╗
-- ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
-- https://github.com/nvim-lualine/lualine.nvim

return {
  "nvim-lualine/lualine.nvim",
  cond = not vim.g.vscode,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function get_theme()
      local colorscheme = vim.g.colors_name
      if not colorscheme then
        return "auto"
      end

      -- Clear module cache to reload updated palettes
      package.loaded["palettes." .. colorscheme] = nil
      local ok, palette = pcall(require, "palettes." .. colorscheme)
      if not ok or not palette.status then
        return "auto"
      end

      local l = palette.status
      local function create_mode(bg, fg, gui)
        return { bg = bg, fg = fg or palette.base.primary_bg, gui = gui }
      end

      local common_b = { bg = l.section_b_bg, fg = l.section_b_fg }
      local common_c = { bg = l.section_c_bg, fg = l.section_c_fg }

      return {
        normal = {
          a = create_mode(l.normal, nil, "bold"),
          b = common_b,
          c = common_c,
        },
        insert = {
          a = create_mode(l.insert, nil, "bold"),
          b = common_b,
          c = common_c,
        },
        visual = {
          a = create_mode(l.visual, palette.base.primary_fg, "bold"),
          b = common_b,
          c = common_c,
        },
        replace = {
          a = create_mode(l.replace, nil, "bold"),
          b = common_b,
          c = common_c,
        },
        command = {
          a = create_mode(l.command, palette.base.primary_fg, "bold"),
          b = common_b,
          c = common_c,
        },
        inactive = {
          a = { bg = l.inactive, fg = l.section_b_fg },
          b = common_b,
          c = common_c,
        },
      }
    end

    local components = {
      spell = function()
        return vim.wo.spell and "󰓆 [" .. vim.o.spelllang .. "]" or ""
      end,
    }

    local custom_extensions = {
      {
        sections = {
          lualine_a = { "mode" },
          lualine_z = {
            function()
              return "CtrlSF"
            end,
          },
        },
        filetypes = { "ctrlsf" },
      },
      {
        sections = {
          lualine_a = {
            function()
              return "NNN"
            end,
          },
        },
        filetypes = {
          "nnn",
        },
      },
      {
        sections = {
          lualine_a = {
            function()
              return vim.fn.getcwd()
            end,
          },
        },
        filetypes = {
          "NvimTree",
        },
      },
    }

    local function setup_lualine()
      require("lualine").setup({
        options = {
          theme = get_theme(),
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode", components.spell },
          lualine_b = {
            { "branch", icon = { "" } },
            "diff",
            "diagnostics",
          },
          lualine_c = {
            { "filename", path = 1 },
          },
          lualine_x = {
            "fileformat",
            "encoding",
            "filesize",
            "filetype",
          },
          lualine_y = {
            "searchcount",
            "location",
            "progress",
          },
          lualine_z = {
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {},
          lualine_b = {
            {
              "buffers",
              mode = 0,
              icons_enabled = false,
              filetype_names = {
                startify = "Startify",
                TelescopePrompt = "Telescope",
                fzf = "FZF",
                nnn = "NNN",
                ctrlsf = "CtrlSF",
                NvimTree = "NvimTree",
              },
              symbols = {
                modified = " ",
                alternate_file = "󱞫 ",
                directory = " ",
              },
              buffers_color = {
                active = "lualine_a_normal",
                inactive = "lualine_c_inactive",
              },
            },
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = vim.list_extend({
          "nvim-tree",
          "fugitive",
          "lazy",
          "quickfix",
          "trouble",
        }, custom_extensions),
      })
    end

    setup_lualine()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = setup_lualine,
    })
  end,
}
