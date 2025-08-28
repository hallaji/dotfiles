--  ██████╗███╗   ███╗██████╗
-- ██╔════╝████╗ ████║██╔══██╗
-- ██║     ██╔████╔██║██████╔╝
-- ██║     ██║╚██╔╝██║██╔═══╝
-- ╚██████╗██║ ╚═╝ ██║██║
--  ╚═════╝╚═╝     ╚═╝╚═╝
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/L3MON4D3/LuaSnip
-- https://github.com/saadparwaiz1/cmp_luasnip

return {
  "hrsh7th/nvim-cmp",
  cond = not vim.g.vscode,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- LSP completions
    "hrsh7th/cmp-buffer",       -- Buffer completions
    "hrsh7th/cmp-path",         -- Path completions
    "L3MON4D3/LuaSnip",         -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Registers LuaSnip as a completion source
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })

    -- Enable completion in git commit buffers
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = "buffer" },
        { name = "path" },
      })
    })
  end,
}
