-- ██╗███╗   ██╗██████╗ ███████╗███╗   ██╗████████╗
-- ██║████╗  ██║██╔══██╗██╔════╝████╗  ██║╚══██╔══╝
-- ██║██╔██╗ ██║██║  ██║█████╗  ██╔██╗ ██║   ██║
-- ██║██║╚██╗██║██║  ██║██╔══╝  ██║╚██╗██║   ██║
-- ██║██║ ╚████║██████╔╝███████╗██║ ╚████║   ██║
-- ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝
-- ██╗     ██╗███╗   ██╗███████╗
-- ██║     ██║████╗  ██║██╔════╝
-- ██║     ██║██╔██╗ ██║█████╗
-- ██║     ██║██║╚██╗██║██╔══╝
-- ███████╗██║██║ ╚████║███████╗
-- ╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
-- https://github.com/Yggdroot/indentLine

return {
  "Yggdroot/indentLine",
  config = function()
    vim.g.indentLine_enabled = 1 -- Enable indentLine
    vim.g.indentLine_setColors = 0 -- Disable default colors
    vim.g.indentLine_char = '' -- Use a thin vertical bar as the indent character
    vim.g.indentLine_fileTypeExclude = {'text', 'startify'} -- Disable indentLine for text and startify buffers
    vim.g.indentLine_bufTypeExclude = {'help', 'terminal'} -- Disable indentLine for help and terminal buffers
    vim.g.indentLine_leadingSpaceEnabled = 1 -- Enable leading space
    vim.g.indentLine_leadingSpaceChar = '┈' -- Use a thin vertical bar as the leading space character
    vim.g.vim_json_conceal = 0 -- Disable JSON syntax conceal
    vim.g.markdown_syntax_conceal = 0 -- Disable Markdown syntax conceal
  end,
}
