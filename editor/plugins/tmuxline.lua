
-- ████████╗███╗   ███╗██╗   ██╗██╗  ██╗██╗     ██╗███╗   ██╗███████╗
-- ╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝██║     ██║████╗  ██║██╔════╝
--    ██║   ██╔████╔██║██║   ██║ ╚███╔╝ ██║     ██║██╔██╗ ██║█████╗
--    ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗ ██║     ██║██║╚██╗██║██╔══╝
--    ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗███████╗██║██║ ╚████║███████╗
--    ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
-- https://github.com/edkolev/tmuxline.vim

vim.g.tmuxline_powerline_separators = 0

vim.g.tmuxline_separators = { -- Use the following separators:
  left = '',
  left_alt = '',
  right = '',
  right_alt = '',
  space = ' '
}

vim.g.tmuxline_preset = { -- Use the following preset:
  a = { ' #S' },
  b = { '󰓩 #I#(tmux list-windows | wc -l | tr -d " ")' },
  c = { ' #{pane_current_command}' },
  cwin = { '󰓩  #W' },
  win = {'󰓪 #I #W' },
  y = { ' #P#{window_panes}' },
  z = { ' #W' },
  options = { ['status-justify'] = 'centre' } -- left, centre, or right
}

vim.g.tmuxline_theme = {
  a =    { '#22272e', '#EEB4B3', 'bold' }, -- 'fg', 'bg', 'comma-separated attributes'
  b =    { '#6C6F93', '#2E303E' },
  c =    { '#3b3d51', '#6C6F93' },
  x =    { '#475262', '#1f242a' },
  y =    { '#6C6F93', '#2E303E' },
  z =    { '#22272e', '#EEB4B3', 'bold' },
  win =  { '#475262', '#1f242a' },
  cwin = { '#6C6F93', '#2E303E' },
  bg =   { '#2E303E', '#1f242a' }
}
