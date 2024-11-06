--  ██████╗ ██████╗ ██████╗ ██╗██╗      ██████╗ ████████╗
-- ██╔════╝██╔═══██╗██╔══██╗██║██║     ██╔═══██╗╚══██╔══╝
-- ██║     ██║   ██║██████╔╝██║██║     ██║   ██║   ██║
-- ██║     ██║   ██║██╔═══╝ ██║██║     ██║   ██║   ██║
-- ╚██████╗╚██████╔╝██║     ██║███████╗╚██████╔╝   ██║
--  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝ ╚═════╝    ╚═╝
--  https://github.com/github/copilot.vim

return {
  "github/copilot.vim",
  cond = not vim.g.vscode,
  config = function()
    vim.g.copilot_no_tab_map = true -- Disable tab mapping
  end,
}
