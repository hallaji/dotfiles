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

-- Show current buffer's directory name in tmux status line when inside tmux
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  callback = function()
    if vim.env.TMUX then
      local current_file = vim.fn.expand("%:p")
      if current_file and current_file ~= "" then
        local buffer_dir = vim.fn.fnamemodify(current_file, ":h")
        local buffer_dirname = vim.fn.fnamemodify(buffer_dir, ":t")
        -- Set tmux user variable with the current buffer's directory name
        vim.fn.system("tmux set-option -g @nvim_buffer_dir '" .. buffer_dirname .. "'")
      end
    end
  end,
})
