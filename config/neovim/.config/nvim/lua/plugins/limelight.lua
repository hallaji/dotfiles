-- ██╗     ██╗███╗   ███╗███████╗██╗     ██╗ ██████╗ ██╗  ██╗████████╗
-- ██║     ██║████╗ ████║██╔════╝██║     ██║██╔════╝ ██║  ██║╚══██╔══╝
-- ██║     ██║██╔████╔██║█████╗  ██║     ██║██║  ███╗███████║   ██║
-- ██║     ██║██║╚██╔╝██║██╔══╝  ██║     ██║██║   ██║██╔══██║   ██║
-- ███████╗██║██║ ╚═╝ ██║███████╗███████╗██║╚██████╔╝██║  ██║   ██║
-- ╚══════╝╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
-- https://github.com/junegunn/limelight.vim

return {
  "junegunn/limelight.vim",
  cond = not vim.g.vscode,
  config = function()
    vim.g.limelight_conceal_ctermfg = 238 -- Set the color of the concealed text in the terminal
    vim.g.limelight_conceal_guifg = require("palettes.catamaran").color.bg4 -- Set the color of the concealed text in the GUI
  end,
}
