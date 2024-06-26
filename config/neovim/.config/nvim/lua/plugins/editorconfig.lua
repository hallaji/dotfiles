-- ███████╗██████╗ ██╗████████╗ ██████╗ ██████╗
-- ██╔════╝██╔══██╗██║╚══██╔══╝██╔═══██╗██╔══██╗
-- █████╗  ██║  ██║██║   ██║   ██║   ██║██████╔╝
-- ██╔══╝  ██║  ██║██║   ██║   ██║   ██║██╔══██╗
-- ███████╗██████╔╝██║   ██║   ╚██████╔╝██║  ██║
-- ╚══════╝╚═════╝ ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
--  ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
-- ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
-- ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
-- ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
-- ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
--  ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝
-- https://github.com/editorconfig/editorconfig-vim

return {
  "editorconfig/editorconfig-vim",
  config = function()
    vim.g.EditorConfig_exclude_patterns = {'fugitive://.*'} -- Ignore fugitive buffers
  end,
}
