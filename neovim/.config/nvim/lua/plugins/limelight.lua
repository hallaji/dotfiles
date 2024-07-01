
-- ██╗     ██╗███╗   ███╗███████╗██╗     ██╗ ██████╗ ██╗  ██╗████████╗
-- ██║     ██║████╗ ████║██╔════╝██║     ██║██╔════╝ ██║  ██║╚══██╔══╝
-- ██║     ██║██╔████╔██║█████╗  ██║     ██║██║  ███╗███████║   ██║
-- ██║     ██║██║╚██╔╝██║██╔══╝  ██║     ██║██║   ██║██╔══██║   ██║
-- ███████╗██║██║ ╚═╝ ██║███████╗███████╗██║╚██████╔╝██║  ██║   ██║
-- ╚══════╝╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
-- https://github.com/junegunn/limelight.vim

return {
  "junegunn/limelight.vim",
  config = function()
    vim.g.limelight_conceal_ctermfg = 238 -- Set the color of the concealed text in the terminal
    vim.g.limelight_conceal_guifg = '#3c4552' -- Set the color of the concealed text in the GUI
  end,
}
