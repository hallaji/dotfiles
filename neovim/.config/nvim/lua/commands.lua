
--  ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
-- ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
-- ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
-- ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
-- ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝

-- ┌─┐┌─┐┌┐┌┌─┐┬─┐┌─┐┬
-- │ ┬├┤ │││├┤ ├┬┘├─┤│
-- └─┘└─┘┘└┘└─┘┴└─┴ ┴┴─┘

-- Check if any buffers were changed outside of Vim and trigger when cursor stops moving
vim.cmd([[autocmd CursorHold,CursorHoldI * checktime]])

-- Check if any buffers were changed outside of Vim and trigger when buffer changes
vim.cmd([[autocmd FocusGained,BufEnter * checktime]])

-- ┌─┐┌─┐┌─┐
-- │  │ ││
-- └─┘└─┘└─┘

-- Define a command to run Prettier formatter using Coc.nvim
vim.cmd([[command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')]])

-- ┌─┐┬ ┬┌┐┌┌┬┐┌─┐─┐ ┬
-- └─┐└┬┘│││ │ ├─┤┌┴┬┘
-- └─┘ ┴ ┘└┘ ┴ ┴ ┴┴ └─

-- Set `shell` syntax for `.env*` files
vim.cmd([[autocmd BufNewFile,BufRead .env* set syntax=sh]])

-- Set `conf` file type for `*.example` files
vim.cmd([[autocmd BufNewFile,BufRead *.example set filetype=conf]])

-- Set `shell` syntax for `freshrc` file
vim.cmd([[autocmd BufNewFile,BufRead freshrc set syntax=sh]])

-- Set `shell` syntax for files with no extension
vim.cmd([[autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | endif]])

-- Set `gitcommit` syntax for `COMMIT_EDITMSG`
vim.cmd([[autocmd BufNewFile,BufRead COMMIT_EDITMSG set syntax=gitcommit]])

-- Enable spell check in git commit message
vim.cmd([[autocmd FileType gitcommit setlocal spell spelllang=en_au]])
