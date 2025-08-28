-- ███╗   ██╗ ██████╗ ███╗   ██╗███████╗    ██╗     ███████╗
-- ████╗  ██║██╔═══██╗████╗  ██║██╔════╝    ██║     ██╔════╝
-- ██╔██╗ ██║██║   ██║██╔██╗ ██║█████╗█████╗██║     ███████╗
-- ██║╚██╗██║██║   ██║██║╚██╗██║██╔══╝╚════╝██║     ╚════██║
-- ██║ ╚████║╚██████╔╝██║ ╚████║███████╗    ███████╗███████║
-- ╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚══════╝╚══════╝
-- https://github.com/nvimtools/none-ls.nvim

return {
  "nvimtools/none-ls.nvim",
  cond = not vim.g.vscode,
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.ktlint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.diagnostics.rubocop,
      },
    })
  end,
}
