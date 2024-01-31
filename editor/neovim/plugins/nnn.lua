
-- ███╗   ██╗███╗   ██╗███╗   ██╗
-- ████╗  ██║████╗  ██║████╗  ██║
-- ██╔██╗ ██║██╔██╗ ██║██╔██╗ ██║
-- ██║╚██╗██║██║╚██╗██║██║╚██╗██║
-- ██║ ╚████║██║ ╚████║██║ ╚████║
-- ╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝  ╚═══╝
-- https://github.com/mcchrish/nnn.vim
-- https://github.com/mcchrish/nnn.vim/blob/master/doc/nnn.txt

vim.g.nnn_set_default_mappings = 0 -- Disable default mappings
vim.g.nnn_command = 'nnn -Aeoi' -- Use the default nnn command with the following flags:
vim.g.nnn_replace_netrw = 0 -- Don't replace netrw
vim.g.nnn_statusline = 0 -- Don't show the statusline
vim.g.nnn_action = { -- Use the following mappings for the following actions:
  ['<c-t>'] = 'tab split',
  ['<c-s>'] = 'split',
  ['<c-v>'] = 'vsplit'
}

