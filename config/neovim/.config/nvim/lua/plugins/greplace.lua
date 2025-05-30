--  ██████╗ ██████╗ ███████╗██████╗ ██╗      █████╗  ██████╗███████╗
-- ██╔════╝ ██╔══██╗██╔════╝██╔══██╗██║     ██╔══██╗██╔════╝██╔════╝
-- ██║  ███╗██████╔╝█████╗  ██████╔╝██║     ███████║██║     █████╗
-- ██║   ██║██╔══██╗██╔══╝  ██╔═══╝ ██║     ██╔══██║██║     ██╔══╝
-- ╚██████╔╝██║  ██║███████╗██║     ███████╗██║  ██║╚██████╗███████╗
--  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝╚══════╝
-- https://github.com/skwp/greplace.vim

return {
  "skwp/greplace.vim",
  cond = not vim.g.vscode,
  config = function()
    vim.o.grepprg = 'ag' -- Use ag as the default grep program
    vim.g.grep_cmd_opts = '--line-numbers --noheading' -- Add line numbers and remove the file name from the output
  end,
}
