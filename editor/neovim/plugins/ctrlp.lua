
--  ██████╗████████╗██████╗ ██╗     ██████╗
-- ██╔════╝╚══██╔══╝██╔══██╗██║     ██╔══██╗
-- ██║        ██║   ██████╔╝██║     ██████╔╝
-- ██║        ██║   ██╔══██╗██║     ██╔═══╝
-- ╚██████╗   ██║   ██║  ██║███████╗██║
--  ╚═════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝
-- https://github.com/ctrlpvim/ctrlp.vim

vim.g.ctrlp_user_command = {'.git', 'cd %s && git ls-files -co --exclude-standard'} -- Ignore files in .gitignore
vim.g.ctrlp_custom_ignore = '\\v[\\/](node_modules|target|dist)|(\\.(swp|ico|git|svn))$' -- Exclude files and directories
vim.g.ctrlp_extensions = {'tag', 'dir', 'line', 'changes', 'mixed'} -- Enable extensions
