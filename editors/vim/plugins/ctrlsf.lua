
--  ██████╗████████╗██████╗ ██╗     ███████╗███████╗
-- ██╔════╝╚══██╔══╝██╔══██╗██║     ██╔════╝██╔════╝
-- ██║        ██║   ██████╔╝██║     ███████╗█████╗
-- ██║        ██║   ██╔══██╗██║     ╚════██║██╔══╝
-- ╚██████╗   ██║   ██║  ██║███████╗███████║██║
--  ╚═════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝
-- https://github.com/dyng/ctrlsf.vim
-- https://github.com/dyng/ctrlsf.vim/blob/master/doc/ctrlsf.txt

vim.g.ctrlsf_default_view_mode = 'normal' -- Default view mode (normal, compact)
vim.g.ctrlsf_position = 'left' -- Default position (left, right, top, bottom)
vim.g.ctrlsf_compact_position = 'bottom_outside' -- Default compact position (left_outside, right_outside, top_outside, bottom_outside)
vim.g.ctrlsf_default_root = 'project' -- Default root (project, cwd)
vim.g.ctrlsf_preview_position = 'inside' -- Default preview position (inside, outside)
vim.g.ctrlsf_auto_preview = 1 -- Automatically preview the search result
vim.g.ctrlsf_auto_close = { normal = 1, compact = 0 } -- Automatically close the window after the search
