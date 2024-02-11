
-- ████████╗███╗   ███╗██╗   ██╗██╗  ██╗██╗     ██╗███╗   ██╗███████╗
-- ╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝██║     ██║████╗  ██║██╔════╝
--    ██║   ██╔████╔██║██║   ██║ ╚███╔╝ ██║     ██║██╔██╗ ██║█████╗
--    ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗ ██║     ██║██║╚██╗██║██╔══╝
--    ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗███████╗██║██║ ╚████║███████╗
--    ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
-- https://github.com/edkolev/tmuxline.vim

-- Airline's theme and following preset will be applied to tmux's statusline when
-- you start vim inside tmux session.

vim.g.tmuxline_powerline_separators = 0 -- Use vim-airline's separators

vim.g.tmuxline_preset = { -- Use the following preset:
  a = ' #S',
  cwin = {'󰓩 #I', '#W'},
  win = {'󰓪 #I', '#W'},
  y = {' #P'},
  z = {' #W'},
  options = {['status-justify'] = 'left'}
}

vim.g.tmuxline_separators = { -- Use the following separators:
  left = '',
  left_alt = '󰁜',
  right = '',
  right_alt = '󰁛',
  space = ' '
}
