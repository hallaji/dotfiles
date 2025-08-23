-- ██████╗ █████╗ ████████╗ █████╗ ███╗   ███╗ █████╗ ██████╗  █████╗ ███╗   ██╗
-- ██╔════╝██╔══██╗╚══██╔══╝██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗████╗  ██║
-- ██║     ███████║   ██║   ███████║██╔████╔██║███████║██████╔╝███████║██╔██╗ ██║
-- ██║     ██╔══██║   ██║   ██╔══██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║
-- ╚██████╗██║  ██║   ██║   ██║  ██║██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║██║ ╚████║
--  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

local theme = require('themes.catamaran')
local p = theme.palette

vim.g.colors_name = "catamaran"

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') == 1 then
  vim.cmd('syntax reset')
end

-- Text and visual guides
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = p.ruler }) -- Column width ruler
vim.api.nvim_set_hl(0, 'Comment', { fg = p.comment }) -- Code comments
vim.api.nvim_set_hl(0, 'Conceal', { fg = p.indent_line }) -- Hidden/concealed text
vim.api.nvim_set_hl(0, 'Constant', { fg = p.constant }) -- Constants and literals
vim.api.nvim_set_hl(0, 'CopilotSuggestion', { fg = p.hint }) -- AI code suggestions

-- Cursor highlights
vim.api.nvim_set_hl(0, 'Cursor', { bg = p.cursor, fg = p.bg_secondary, bold = true }) -- Main cursor
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = p.focus, fg = p.bg_secondary }) -- Current column highlight
vim.api.nvim_set_hl(0, 'CursorLine', {}) -- Current line highlight
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = p.focus }) -- Line number on cursor line

-- Diff and Git highlights
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = p.success }) -- Added lines in diffs
vim.api.nvim_set_hl(0, 'DiffChange', { fg = p.warning }) -- Changed lines in diffs
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = p.error }) -- Deleted lines in diffs
vim.api.nvim_set_hl(0, 'DiffNew', { fg = p.success }) -- New files in diffs

-- General UI
vim.api.nvim_set_hl(0, 'Directory', { fg = p.primary }) -- Directory names in file explorers
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = p.bg_tertiary }) -- ~ lines after end of buffer
vim.api.nvim_set_hl(0, 'Error', { bg = p.bg_primary, fg = p.error }) -- General error highlights
vim.api.nvim_set_hl(0, 'ErrorMsg', { bg = p.bg_primary, fg = p.error }) -- Error messages in command line
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = p.bg_secondary, fg = p.border }) -- Borders around floating windows
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = p.focus, bold = true }) -- Fold markers column (+/-)
vim.api.nvim_set_hl(0, 'Folded', { fg = p.focus, italic = true }) -- Folded text lines
vim.api.nvim_set_hl(0, 'Function', { fg = p.func, bold = true }) -- Function names
vim.api.nvim_set_hl(0, 'Identifier', { fg = p.identifier }) -- Variable names
vim.api.nvim_set_hl(0, 'LineNr', { bg = p.bg_primary, fg = p.bg_tertiary }) -- Line numbers
vim.api.nvim_set_hl(0, 'MatchParen', { bg = p.bg_secondary, fg = p.primary }) -- Matching parentheses
vim.api.nvim_set_hl(0, 'MiniTrailspace', { bg = p.error }) -- Trailing whitespace
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = p.primary }) -- Mode messages (-- INSERT --, etc.)
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = p.primary }) -- "Press ENTER" prompts
vim.api.nvim_set_hl(0, 'NonText', { fg = p.bg_tertiary }) -- Invisible characters (@, ~, etc.)
vim.api.nvim_set_hl(0, 'Normal', { fg = p.fg_primary }) -- Default text
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = p.bg_secondary, fg = p.fg_secondary }) -- Text in floating windows
vim.api.nvim_set_hl(0, 'Question', { fg = p.identifier }) -- "Press ENTER" and similar prompts
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = p.bg_secondary, fg = p.fg_secondary }) -- Current line in quickfix window
vim.api.nvim_set_hl(0, 'SignColumn', { bg = p.bg_primary, fg = p.fg_secondary }) -- Sign column for git/diagnostic signs

-- Search and navigation
vim.api.nvim_set_hl(0, 'IncSearch', { reverse = true }) -- Incremental search highlighting
vim.api.nvim_set_hl(0, 'Search', { bg = p.search_bg, fg = p.search }) -- Search matches

-- Tabs and status
vim.api.nvim_set_hl(0, 'TabLine', { bg = p.bg_secondary, fg = p.fg_secondary }) -- Inactive tab pages
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = p.bg_primary }) -- Tab line background
vim.api.nvim_set_hl(0, 'TabLineSel', { bg = p.primary, fg = p.bg_secondary }) -- Active tab page

-- Plugin-specific
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = p.secondary }) -- Folder icons in nvim-tree
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFile', { fg = p.primary, bold = true, underline = true }) -- Currently opened files

-- Syntax elements
vim.api.nvim_set_hl(0, 'Operator', { fg = p.operator }) -- Operators (+, -, *, etc.)
vim.api.nvim_set_hl(0, 'PreProc', { fg = p.preprocessor }) -- Preprocessor directives (#include, #define)
vim.api.nvim_set_hl(0, 'Special', { fg = p.special }) -- Special characters and symbols
vim.api.nvim_set_hl(0, 'Statement', { fg = p.keyword }) -- Keywords (if, for, while, return)
vim.api.nvim_set_hl(0, 'String', { fg = p.string }) -- String literals
vim.api.nvim_set_hl(0, 'Title', { fg = p.info }) -- Titles and headings
vim.api.nvim_set_hl(0, 'Todo', { bg = p.error, fg = p.bg_secondary }) -- To do comments
vim.api.nvim_set_hl(0, 'Type', { fg = p.identifier }) -- Data types (int, string, etc.)
vim.api.nvim_set_hl(0, 'Underlined', { underline = true, fg = p.underline }) -- Underlined text
vim.api.nvim_set_hl(0, 'VertSplit', { bg = p.bg_secondary, fg = p.bg_secondary }) -- Vertical window separators
vim.api.nvim_set_hl(0, 'Visual', { bg = p.identifier, fg = p.bg_secondary }) -- Visual mode selection
vim.api.nvim_set_hl(0, 'WarningMsg', { bg = p.bg_primary, fg = p.warning }) -- Warning messages
vim.api.nvim_set_hl(0, 'Whitespace', { fg = p.bg_primary }) -- Visible whitespace characters
vim.api.nvim_set_hl(0, 'WildMenu', { bg = p.bg_primary, fg = p.primary }) -- Command completion menu

-- Popup menu
vim.api.nvim_set_hl(0, 'Pmenu', { bg = p.bg_secondary, fg = p.primary }) -- Popup menu background
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = p.bg_secondary }) -- Popup menu scrollbar
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = p.primary, fg = p.bg_secondary }) -- Selected popup menu item
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = p.secondary, fg = p.bg_secondary }) -- Popup menu scrollbar thumb

-- Spell checking
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = p.error }) -- Misspelled words
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = p.fg_tertiary }) -- Words needing capitalization
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = p.fg_tertiary }) -- Words flagged by local dictionary
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = p.fg_tertiary }) -- Rare words

-- Terminal
vim.api.nvim_set_hl(0, 'TermCursorNC', { bg = p.identifier, fg = p.bg_secondary }) -- Terminal cursor when not focused

-- WhichKey
vim.api.nvim_set_hl(0, 'WhichKeyDesc', { fg = p.identifier }) -- Key binding descriptions
vim.api.nvim_set_hl(0, 'WhichKeyGroup', { fg = p.secondary }) -- Key binding group names
vim.api.nvim_set_hl(0, 'WhichKeyIcon', { fg = p.constant }) -- Icons in which-key menu

-- Diagnostic text highlights (inline diagnostic messages)
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = p.error }) -- Error text
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = p.warning }) -- Warning text
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = p.info }) -- Info text
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = p.hint }) -- Hint text

-- Diagnostic underlines
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, fg = p.error }) -- Error underline
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, fg = p.warning }) -- Warning underline
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, fg = p.info }) -- Info underline
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { undercurl = true, fg = p.hint }) -- Hint underline
vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = p.comment, undercurl = true, italic = true }) -- Unused/unnecessary
vim.api.nvim_set_hl(0, 'DiagnosticDeprecated', { undercurl = true, strikethrough = true }) -- Deprecated code

-- Diagnostic signs
vim.api.nvim_set_hl(0, 'DiagnosticSignError', { bg = p.bg_primary, fg = p.error }) -- Error signs (E) in gutter
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { bg = p.bg_primary, fg = p.warning }) -- Warning signs (W) in gutter
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { bg = p.bg_primary, fg = p.info }) -- Info signs (I) in gutter
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { bg = p.bg_primary, fg = p.hint }) -- Hint signs (H) in gutter

-- Floating diagnostic windows
vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { fg = p.error }) -- Error in floating window
vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarn', { fg = p.warning }) -- Warning in floating window
vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { fg = p.info }) -- Info in floating window
vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { fg = p.hint }) -- Hint in floating window

-- Virtual text (inline diagnostic text)
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = p.error, italic = true }) -- Error virtual text
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = p.warning, italic = true }) -- Warning virtual text
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = p.info, italic = true }) -- Info virtual text
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = p.hint, italic = true }) -- Hint virtual text

local links = {
  -- Startify - Start screen plugin
  { 'StartifyBracket', 'Comment' }, -- Brackets around items
  { 'StartifyFile', 'Identifier' }, -- File names
  { 'StartifyFooter', 'Constant' }, -- Footer text
  { 'StartifyHeader', 'Constant' }, -- Header ASCII art
  { 'StartifyNumber', 'Special' }, -- Item numbers
  { 'StartifyPath', 'Comment' }, -- File paths
  { 'StartifySection', 'Statement' }, -- Section headers
  { 'StartifySlash', 'Comment' }, -- Path separators
  { 'StartifySpecial', 'Normal' }, -- Special characters

  -- GitSigns - Git integration for buffer
  { 'GitSignsAdd', 'DiffAdd' }, -- Added lines indicator
  { 'GitSignsChange', 'DiffChange' }, -- Changed lines indicator
  { 'GitSignsCurrentLineBlame', 'Conceal' }, -- Inline blame text
  { 'GitSignsDelete', 'DiffDelete' }, -- Deleted lines indicator

  -- NvimTree - File explorer
  { 'NvimTreeFolderName', 'NvimTreeFolderIcon' }, -- Folder names
  { 'NvimTreeGitDeleted', 'DiffDelete' }, -- Deleted files
  { 'NvimTreeGitDirty', 'DiffChange' }, -- Modified files
  { 'NvimTreeGitIgnored', 'Comment' }, -- Ignored files
  { 'NvimTreeGitNew', 'DiffNew' }, -- New files
  { 'NvimTreeGitRenamed', 'DiffChange' }, -- Renamed files
  { 'NvimTreeGitStaged', 'DiffAdd' }, -- Staged files

  -- CtrlP - Fuzzy file finder
  { 'CtrlPMatch', 'Title' }, -- Matched characters
  { 'CtrlPMode2', 'StatusLine' }, -- Mode indicator
  { 'CtrlPPrtCursor', 'Cursor' }, -- Prompt cursor

  -- FzfLua - Lua-based fuzzy finder
  { 'FzfLuaBorder', 'FloatBorder' }, -- Window border
  { 'FzfLuaNormal', 'NormalFloat' }, -- Normal text

  -- Nnn - Terminal file manager integration
  { 'NnnBorder', 'FloatBorder' }, -- Window border
  { 'NnnNormalFloat', 'NormalFloat' }, -- Normal text
  { 'NnnWinSeparator', 'VertSplit' }, -- Window separator

  -- Telescope - Fuzzy finder and picker
  { 'TelescopeBorder', 'FloatBorder' }, -- Window border

  -- WhichKey - Key binding helper
  { 'WhichKeyBorder', 'FloatBorder' }, -- Window border

  -- Window - General window elements
  { 'WinSeparator', 'VertSplit' }, -- Window separators

  -- CtrlSF - Search and replace tool
  { 'ctrlsfFilename', 'NvimTreeFolderIcon' }, -- File names
  { 'ctrlsfLnumMatch', 'NvimTreeFolderIcon' }, -- Line numbers
  { 'ctrlsfMatch', 'NvimTreeOpenedFile' }, -- Matched text
  { 'ctrlsfSearchDone', 'DiffAdd' }, -- Search complete
  { 'ctrlsfSearching', 'DiffDelete' }, -- Search in progress
  { 'ctrlsfSelectedLine', 'PmenuThumb' }, -- Selected line

  -- Markdown - Document formatting
  { 'markdownBold', 'Special' }, -- Bold text
  { 'markdownItalic', 'Identifier' }, -- Italic text
  { 'markdownCode', 'String' }, -- Inline code
  { 'markdownCodeDelimiter', 'String' }, -- Code block delimiters
  { 'markdownH1', 'Title' }, -- Level 1 headings
  { 'markdownH2', 'Title' }, -- Level 2 headings
  { 'markdownH3', 'Title' }, -- Level 3 headings
  { 'markdownH4', 'Title' }, -- Level 4 headings
  { 'markdownH5', 'Title' }, -- Level 5 headings
  { 'markdownH6', 'Title' }, -- Level 6 headings
  { 'markdownHeadingDelimiter', 'Comment' }, -- Heading # symbols
  { 'markdownRule', 'Comment' }, -- Horizontal rules
  { 'markdownBlockquote', 'Comment' }, -- Block quotes
  { 'markdownLinkDelimiter', 'Comment' }, -- Link brackets
  { 'markdownLinkText', 'Underlined' }, -- Link text
  { 'markdownUrl', 'Constant' }, -- URLs
  { 'markdownListMarker', 'Special' }, -- List bullets
  { 'markdownOrderedListMarker', 'Special' }, -- Numbered lists
  { 'mkdNonListItemBlock', 'Normal' }, -- Regular text blocks
  { 'mkdListItem', 'Special' }, -- List items
  { 'mkdHeading', 'Title' }, -- Headings
  { 'mkdLink', 'Underlined' }, -- Links
  { 'mkdURL', 'Constant' }, -- URLs
  { 'mkdDelimiter', 'Comment' }, -- Delimiters
  { 'mkdSnippetSHELL', 'String' }, -- Shell code snippets
  { 'htmlItalic', 'Identifier' }, -- HTML italic in markdown
  { 'htmlBold', 'Special' }, -- HTML bold in markdown

  -- Completion - nvim-cmp autocompletion
  { 'CmpItemKind', 'Comment' }, -- Item type indicators
  { 'CmpItemAbbr', 'Normal' }, -- Main completion text
  { 'CmpItemAbbrMatch', 'Special' }, -- Matched characters
  { 'CmpItemMenu', 'Comment' }, -- Source labels

  -- Terminal - Built-in terminal
  { 'TermCursor', 'Cursor' }, -- Terminal cursor

  -- Diff - File differences
  { 'diffAdded', 'DiffAdd' }, -- Added lines
  { 'diffRemoved', 'DiffDelete' }, -- Removed lines
  { 'diffChanged', 'DiffChange' }, -- Modified lines
  { 'diffFile', 'Title' }, -- File headers
  { 'diffLine', 'Comment' }, -- Line context info

  -- Help - Documentation
  { 'helpHyperTextJump', 'Constant' }, -- Clickable help links
}

-- Apply all the links
for _, link in ipairs(links) do
  vim.api.nvim_set_hl(0, link[1], { link = link[2] })
end
