-- ██╗    ██╗██╗  ██╗██╗ ██████╗██╗  ██╗    ██╗  ██╗███████╗██╗   ██╗
-- ██║    ██║██║  ██║██║██╔════╝██║  ██║    ██║ ██╔╝██╔════╝╚██╗ ██╔╝
-- ██║ █╗ ██║███████║██║██║     ███████║    █████╔╝ █████╗   ╚████╔╝
-- ██║███╗██║██╔══██║██║██║     ██╔══██║    ██╔═██╗ ██╔══╝    ╚██╔╝
-- ╚███╔███╔╝██║  ██║██║╚██████╗██║  ██║    ██║  ██╗███████╗   ██║
--  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚══════╝   ╚═╝
-- https://github.com/folke/which-key.nvim

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    print(os.getenv("PWD"))
    require("which-key").setup {
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        ["<leader>"] = "󰸣",
        ["<space>"] = "󱁐",
        ["<Space>"] = "󱁐",
        ["<Tab>"] = "󰌒",
        ["<S-Tab>"] = "󰘶󰌒",
        ["<CR>"] = "󰌑",
        ["<C-Bslash>"] = "󰘴\\",
        ["<C-Down>"] = "󰘴󰛀",
        ["<C-Up>"] = "󰘴󰛃",
        ["<C-Right>"] = "󰘴󰛂",
        ["<C-Left>"] = "󰘴󰛁",
        ["<PageUp>"] = "󰛼",
        ["<PageDown>"] = "󰛻",
        ["<C-B>"] = "󰘴B",
        ["<C-D>"] = "󰘴D",
        ["<C-F>"] = "󰘴F",
        ["<C-G>"] = "󰘴G",
        ["<C-H>"] = "󰘴H",
        ["<C-J>"] = "󰘴J",
        ["<C-K>"] = "󰘴K",
        ["<C-L>"] = "󰘴L",
        ["<C-N>"] = "󰘴N",
        ["<C-O>"] = "󰘴O",
        ["<C-P>"] = "󰘴P",
        ["<C-Q>"] = "󰘴Q",
        ["<C-S>"] = "󰘴S",
        ["<C-T>"] = "󰘴T",
        ["<C-U>"] = "󰘴U",
        ["<C-V>"] = "󰘴V",
        ["<C-W>"] = "󰘴W",
        ["<c-w>"] = "󰘴W",
        ["<C-X>"] = "󰘴X",
        ["<C-Space>"] = "󰘴󱁐",
      },
      icons = {
        breadcrumb = "  ", -- symbol used in the command line area that shows your active key combo
        separator = "  ", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
      },
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
      },
      layout = {
        align = "center", -- align columns left, center or right
      },
    }
  end,
}
