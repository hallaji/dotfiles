-- ███╗   ██╗ ██████╗ ██╗ ██████╗███████╗
-- ████╗  ██║██╔═══██╗██║██╔════╝██╔════╝
-- ██╔██╗ ██║██║   ██║██║██║     █████╗
-- ██║╚██╗██║██║   ██║██║██║     ██╔══╝
-- ██║ ╚████║╚██████╔╝██║╚██████╗███████╗
-- ╚═╝  ╚═══╝ ╚═════╝ ╚═╝ ╚═════╝╚══════╝
-- https://github.com/folke/noice.nvim
-- https://github.com/MunifTanjim/nui.nvim
-- https://github.com/smjonas/inc-rename.nvim
-- https://github.com/rcarriga/nvim-notify

return {
  "folke/noice.nvim",

  dependencies = {
    "MunifTanjim/nui.nvim",
    { "smjonas/inc-rename.nvim", opts = {}, },
    {
      "rcarriga/nvim-notify",
      opts = {
        background_colour = "#000000",
      }
    },
  },

  event = "VeryLazy",
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    presets = {
      inc_rename = true, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
      long_message_to_split = true, -- long messages will be sent to a split
    },
  },
}
