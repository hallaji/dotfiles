
-- ███╗   ██╗███████╗████████╗██████╗ ██╗    ██╗
-- ████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║    ██║
-- ██╔██╗ ██║█████╗     ██║   ██████╔╝██║ █╗ ██║
-- ██║╚██╗██║██╔══╝     ██║   ██╔══██╗██║███╗██║
-- ██║ ╚████║███████╗   ██║   ██║  ██║╚███╔███╔╝
-- ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚══╝╚══╝
-- https://github.com/vim-scripts/netrw.vim
-- https://www.vim.org/scripts/script.php?script_id=1075

return {
  "vim-scripts/netrw.vim",
  config = function()
    vim.g.loaded_netrw = 1 -- Disable netrw
    vim.g.loaded_netrwPlugin = 1 -- Disable netrw plugin
    vim.g.netrw_banner = 0 -- Disable the banner
    vim.g.netrw_keepdir = 0 -- Don't keep the directory open when opening a file
    vim.g.netrw_liststyle = 0 -- Use the default list style
    vim.g.netrw_sort_options = 'i' -- Sort files by name
    vim.g.netrw_browse_split = 0 -- Don't open the file in a split window
    vim.g.netrw_hide = 1 -- Hide the buffer when browsing
  end,
}
