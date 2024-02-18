
-- ██╗     ██╗   ██╗ █████╗ ██╗     ██╗███╗   ██╗███████╗
-- ██║     ██║   ██║██╔══██╗██║     ██║████╗  ██║██╔════╝
-- ██║     ██║   ██║███████║██║     ██║██╔██╗ ██║█████╗
-- ██║     ██║   ██║██╔══██║██║     ██║██║╚██╗██║██╔══╝
-- ███████╗╚██████╔╝██║  ██║███████╗██║██║ ╚████║███████╗
-- ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
-- https://github.com/nvim-lualine/lualine.nvim

require('lualine').setup {
  options = {
    theme = catamaran,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', icon = { '' } },
      'diff',
      'diagnostics',
    },
    lualine_c = {
      { 'filename', path = 1, }
    },
    lualine_x = {
      'fileformat',
      'encoding',
      'filesize',
      'filetype',
    },
    lualine_y = {
      'location',
      'progress',
    },
    lualine_z = {
      {
        'windows',
        mode = 1,
        icons_enabled = true,
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {},
    lualine_b = {
      {
        'buffers',
        mode = 0,
        filetype_names = {
          startify = 'Startify',
          TelescopePrompt = 'Telescope',
          fzf = 'FZF',
        },
        symbols = {
          modified = ' ●',
          alternate_file = ' ',
          directory =  ' ',
        },
      }
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'tabs',
        mode = 2,
        path = 0,
      }
    },
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
  extensions = {
    'nvim-tree',
    'fugitive',
    'lazy',
    'quickfix',
    'trouble',
  },
}
