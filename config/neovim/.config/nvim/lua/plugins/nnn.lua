-- ███╗   ██╗███╗   ██╗███╗   ██╗
-- ████╗  ██║████╗  ██║████╗  ██║
-- ██╔██╗ ██║██╔██╗ ██║██╔██╗ ██║
-- ██║╚██╗██║██║╚██╗██║██║╚██╗██║
-- ██║ ╚████║██║ ╚████║██║ ╚████║
-- ╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝  ╚═══╝
-- https://github.com/mcchrish/nnn.vim
-- https://github.com/mcchrish/nnn.vim/blob/master/doc/nnn.txt

return {
  "mcchrish/nnn.vim",
  cond = not vim.g.vscode,
  config = function()
    vim.g.nnn_set_default_mappings = 0 -- Disable default mappings
    vim.g.nnn_command = 'nnn -AHei' -- Use the default nnn command with the following flags
    vim.g.nnn_statusline = 0 -- Don't show the statusline
    vim.g.nnn_action = { -- Use the following mappings for the following actions:
      ['<c-t>'] = 'tab split',
      ['<c-s>'] = 'split',
      ['<c-v>'] = 'vsplit'
    }
  end,
}
