-- ██╗   ██╗██╗███╗   ███╗██╗   ██╗██╗  ██╗
-- ██║   ██║██║████╗ ████║██║   ██║╚██╗██╔╝
-- ██║   ██║██║██╔████╔██║██║   ██║ ╚███╔╝
-- ╚██╗ ██╔╝██║██║╚██╔╝██║██║   ██║ ██╔██╗
--  ╚████╔╝ ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
--   ╚═══╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝
-- https://github.com/preservim/vimux

return {
  "preservim/vimux",
  cond = not vim.g.vscode,
}
