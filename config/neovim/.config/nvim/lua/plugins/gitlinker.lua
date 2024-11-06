--  ██████╗ ██╗████████╗██╗     ██╗███╗   ██╗██╗  ██╗███████╗██████╗
-- ██╔════╝ ██║╚══██╔══╝██║     ██║████╗  ██║██║ ██╔╝██╔════╝██╔══██╗
-- ██║  ███╗██║   ██║   ██║     ██║██╔██╗ ██║█████╔╝ █████╗  ██████╔╝
-- ██║   ██║██║   ██║   ██║     ██║██║╚██╗██║██╔═██╗ ██╔══╝  ██╔══██╗
-- ╚██████╔╝██║   ██║   ███████╗██║██║ ╚████║██║  ██╗███████╗██║  ██║
--  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
-- https://github.com/linrongbin16/gitlinker.nvim

return {
  "linrongbin16/gitlinker.nvim",
  cond = not vim.g.vscode,
  config = function()
    require("gitlinker").setup({
      message = false,
    })
  end,
}
