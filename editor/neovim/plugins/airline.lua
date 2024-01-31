
--  █████╗ ██╗██████╗ ██╗     ██╗███╗   ██╗███████╗
-- ██╔══██╗██║██╔══██╗██║     ██║████╗  ██║██╔════╝
-- ███████║██║██████╔╝██║     ██║██╔██╗ ██║█████╗
-- ██╔══██║██║██╔══██╗██║     ██║██║╚██╗██║██╔══╝
-- ██║  ██║██║██║  ██║███████╗██║██║ ╚████║███████╗
-- ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
-- https://github.com/vim-airline/vim-airline
-- https://github.com/vim-airline/vim-airline/wiki/Screenshots

if vim.g.airline_symbols == nil then -- check if airline symbols are already set
  vim.g.airline_symbols = {} -- create airline symbols table
end

vim.g.airline_left_sep = '' -- left separator
vim.g.airline_right_sep = '' -- right separator
vim.g.airline_symbols.colnr = ' ' -- column number symbol
vim.g.airline_symbols.crypt = '󱆄' -- encryption symbol
vim.g.airline_symbols.linenr = ' ' -- line number symbol
vim.g.airline_symbols.maxlinenr = '' -- maximum line number symbol
vim.g.airline_symbols.branch = '' -- branch symbol
vim.g.airline_symbols.paste = '' -- paste symbol
vim.g.airline_symbols.spell = '󰓆' -- spell symbol
vim.g.airline_symbols.notexists = 'Ɇ' -- file does not exist symbol
vim.g.airline_symbols.whitespace = '' -- whitespace symbol
vim.g.airline_symbols.dirty = ' ' -- dirty symbol
vim.g.airline_symbols.readonly = '󰌾' -- read only symbol

vim.g.airline_theme = 'catamaran' -- set airline theme

vim.g['airline#extensions#tabline#enabled'] = 1 -- enable tabline extension
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail' -- set tabline formatter

vim.g.airline_powerline_fonts = 0 -- disable powerline fonts

vim.g['airline#extensions#tmuxline#enabled'] = 1 -- enable tmuxline extension
vim.g['airline#extensions#tmuxline#color_template'] = 'normal' -- set tmuxline color template
vim.g['airline#extensions#tmuxline#snapshot_file'] = '~/.tmux-statusline-colors.conf' -- set tmuxline snapshot file

vim.g.airline_mode_map = { --
  ['__'] = '-',
  ['c'] = 'C',
  ['i'] = 'I',
  ['ic'] = 'I',
  ['ix'] = 'I',
  ['n'] = 'N',
  ['multi'] = 'M',
  ['ni'] = 'N',
  ['no'] = 'N',
  ['R'] = 'R',
  ['Rv'] = 'R',
  ['s'] = 'S',
  ['S'] = 'S-L',
  [''] = 'S-B',
  ['t'] = 'T',
  ['v'] = 'V',
  ['V'] = 'V-L',
  [''] = 'V-B',
}
