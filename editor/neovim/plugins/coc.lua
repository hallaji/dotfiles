
--  ██████╗ ██████╗  ██████╗
-- ██╔════╝██╔═══██╗██╔════╝
-- ██║     ██║   ██║██║
-- ██║     ██║   ██║██║
-- ╚██████╗╚██████╔╝╚██████╗
--  ╚═════╝ ╚═════╝  ╚═════╝
-- https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
-- https://github.com/neoclide/coc.nvim/wiki/Language-servers

vim.g.coc_config_home = "$DOTFILES/config/coc" -- Global configuration from dotfiles directory

vim.g.coc_global_extensions = { -- List of COC extensions to install after starting the service
  'coc-tsserver',
  'coc-go',
  'coc-java',
  'coc-kotlin',
  'coc-solargraph',
  'coc-pyright',
  'coc-json',
  'coc-yaml',
  'coc-html',
  'coc-css',
  'coc-cssmodules',
  'coc-prettier',
  'coc-eslint',
  'coc-marketplace',
  'coc-calc',
  'coc-docker',
  'coc-highlight',
  'coc-markdownlint',
}
