-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗      ██╗     ██╗███╗   ██╗████████╗
-- ████╗  ██║██║   ██║██║████╗ ████║      ██║     ██║████╗  ██║╚══██╔══╝
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║█████╗██║     ██║██╔██╗ ██║   ██║
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██║     ██║██║╚██╗██║   ██║
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║      ███████╗██║██║ ╚████║   ██║
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝      ╚══════╝╚═╝╚═╝  ╚═══╝   ╚═╝
-- https://github.com/mfussenegger/nvim-lint

return {
  "mfussenegger/nvim-lint",
  cond = not vim.g.vscode,
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      ruby = { "rubocop" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
