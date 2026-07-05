-- ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
-- ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
--    ██║   ███████║█████╗  ██╔████╔██║█████╗
--    ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝
--    ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
--    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝

local M = {}

-- Helper to get env var with fallback
function M.get_color(env_var, fallback)
  return vim.env[env_var] or fallback
end

function M.apply(p, name)
  -- Clear existing highlights and set color scheme name
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  local highlights = {
    -- General text
    Normal = { fg = p.color.fg0 }, -- Default text
    NonText = { fg = p.color.bg3 }, -- Invisible characters (@, ~, etc.)
    Conceal = { fg = p.color.bg4 }, -- Concealed text
    MoreMsg = { fg = p.ui.accent }, -- Prompt messages
    ModeMsg = { fg = p.ui.accent_alt }, -- Mode messages (-- INSERT --, etc.)

    -- Cursor
    Cursor = { bg = p.ui.cursor, fg = p.color.bg2 }, -- Main cursor
    CursorColumn = {}, -- Cursor column highlight
    CursorLine = {}, -- Cursor line highlight
    CursorLineNr = { fg = p.ui.focus }, -- Line number on cursor line

    -- Diff and Git highlights
    DiffAdd = { fg = p.ui.success }, -- Added lines in diffs
    DiffChange = { fg = p.ui.warning }, -- Changed lines in diffs
    DiffDelete = { fg = p.ui.error }, -- Deleted lines in diffs
    DiffNew = { fg = p.ui.success }, -- New files in diffs

    -- General UI
    NormalFloat = { bg = p.color.bg2, fg = p.color.fg1 }, -- Text in floating windows
    FloatBorder = { fg = p.ui.border }, -- Borders around floating windows
    ColorColumn = { bg = p.color.bg1 }, -- Line length guidelines
    LineNr = { fg = p.color.bg4 }, -- Line numbers
    EndOfBuffer = { fg = p.color.bg4 }, -- Lines after end of buffer (~)
    SignColumn = {}, -- Sign column for git/diagnostic signs
    StatusLine = { bg = p.color.bg0, fg = p.color.fg0 }, -- Status line
    StatusLineNC = { bg = p.color.bg0, fg = p.color.fg0 }, -- Inactive status line
    VertSplit = { bg = p.color.bg0, fg = p.color.bg0 }, -- Vertical window separators
    Visual = { bg = p.ui.focus, fg = p.color.bg2 }, -- Visual mode selection
    MatchParen = { bg = p.color.bg3, fg = p.ui.accent }, -- Matching parentheses
    FoldColumn = { fg = p.ui.focus, bold = true }, -- Fold markers column (+/-)
    Folded = { fg = p.ui.focus, italic = true }, -- Folded text lines
    MiniTrailspace = { bg = p.ui.error }, -- Trailing whitespace
    Error = { fg = p.ui.error }, -- General error highlights
    ErrorMsg = { fg = p.ui.error }, -- Error messages in command line
    WarningMsg = { fg = p.ui.warning }, -- Warning messages
    Question = { fg = p.ui.focus }, -- "Press ENTER" and similar prompts
    QuickFixLine = { fg = p.color.fg1 }, -- Current line in quickfix window
    IncSearch = { bg = p.ui.accent_alt, fg = p.color.bg2, undercurl = true, bold = true }, -- Incremental search highlighting
    Search = { bg = p.ui.focus, fg = p.color.bg2, undercurl = true, bold = true }, -- Search matches

    -- Syntax elements
    Directory = { fg = p.ui.accent }, -- Directory names in file explorers
    Function = { fg = p.code.func, bold = true }, -- Function names
    Identifier = { fg = p.code.identifier }, -- Variable names
    Comment = { fg = p.code.comment }, -- Code comments
    Constant = { fg = p.code.constant }, -- Constants and literals
    Operator = { fg = p.code.operator }, -- Operators (+, -, *, etc.)
    PreProc = { fg = p.code.preprocessor }, -- Preprocessor directives (#include, #define)
    Special = { fg = p.code.special }, -- Special characters and symbols
    Statement = { fg = p.code.keyword }, -- Keywords (if, for, while, return)
    String = { fg = p.code.string }, -- String literals
    Title = { fg = p.ui.info }, -- Titles and headings
    Todo = { bg = p.ui.error, fg = p.color.bg2 }, -- To do comments
    Type = { fg = p.code.identifier }, -- Data types (int, string, etc.)
    Underlined = { underline = true, fg = p.color.sky }, -- Underlined text

    -- Popup menu
    PmenuThumb = { bg = p.ui.accent_alt }, -- Popup menu scrollbar thumb
    -- highlight Pmenu guibg=red guifg=whitePmenu = { bg = p.color.bg0, fg = p.color.fg0 }, -- Popup menu background
    -- PmenuSel = { bg = p.ui.accent, fg = p.color.bg2 }, -- Selected popup menu item
    -- PmenuSbar = { bg = p.color.bg3 }, -- Popup menu scrollbar
    -- PmenuKind = { fg = p.code.comment }, -- Popup menu item kind
    -- PmenuKindSel = { fg = p.code.constant }, -- Selected popup menu item kind

    -- Spell checking
    SpellBad = { undercurl = true, sp = p.ui.error }, -- Misspelled words
    SpellCap = { undercurl = true, sp = p.color.fg2 }, -- Words needing capitalization
    SpellLocal = { undercurl = true, sp = p.color.fg2 }, -- Words flagged by local dictionary
    SpellRare = { undercurl = true, sp = p.color.fg2 }, -- Rare words

    -- Diagnostic texts
    DiagnosticError = { fg = p.ui.error }, -- Error text
    DiagnosticWarn = { fg = p.ui.warning }, -- Warning text
    DiagnosticInfo = { fg = p.ui.info }, -- Info text
    DiagnosticHint = { fg = p.ui.hint }, -- Hint text

    -- Diagnostic underlines
    DiagnosticUnderlineError = { undercurl = true, fg = p.ui.error }, -- Error underline
    DiagnosticUnderlineWarn = { undercurl = true, fg = p.ui.warning }, -- Warning underline
    DiagnosticUnderlineInfo = { undercurl = true, fg = p.ui.info }, -- Info underline
    DiagnosticUnderlineHint = { undercurl = true, fg = p.ui.hint }, -- Hint underline
    DiagnosticUnnecessary = { fg = p.code.comment, undercurl = true, italic = true }, -- Unused/unnecessary
    DiagnosticDeprecated = { undercurl = true, strikethrough = true }, -- Deprecated code

    -- Diagnostic signs
    DiagnosticSignError = { fg = p.ui.error }, -- Error signs (E) in gutter
    DiagnosticSignWarn = { fg = p.ui.warning }, -- Warning signs (W) in gutter
    DiagnosticSignInfo = { fg = p.ui.info }, -- Info signs (I) in gutter
    DiagnosticSignHint = { fg = p.ui.hint }, -- Hint signs (H) in gutter

    -- Diagnostic flaoting windows
    DiagnosticFloatingError = { fg = p.ui.error }, -- Error in floating window
    DiagnosticFloatingWarn = { fg = p.ui.warning }, -- Warning in floating window
    DiagnosticFloatingInfo = { fg = p.ui.info }, -- Info in floating window
    DiagnosticFloatingHint = { fg = p.ui.hint }, -- Hint in floating window

    -- Diagnostic virtual texts
    DiagnosticVirtualTextError = { fg = p.ui.error, italic = true }, -- Error virtual text
    DiagnosticVirtualTextWarn = { fg = p.ui.warning, italic = true }, -- Warning virtual text
    DiagnosticVirtualTextInfo = { fg = p.ui.info, italic = true }, -- Info virtual text
    DiagnosticVirtualTextHint = { fg = p.ui.hint, italic = true }, -- Hint virtual text

    -- WhichKey
    WhichKeyDesc = { fg = p.code.identifier }, -- Key binding descriptions
    WhichKeyGroup = { fg = p.ui.accent_alt }, -- Key binding group names
    WhichKeyIcon = { fg = p.code.constant }, -- Icons in which-key menu

    -- NvimTree
    NvimTreeFolderIcon = { fg = p.ui.accent_alt }, -- Folder icons in nvim-tree
    NvimTreeOpenedFile = { fg = p.ui.accent, bold = true, underline = true }, -- Currently opened files
  }

  local links = {
    -- Terminal - Built-in terminal
    TermCursor = "Cursor", -- Terminal cursor
    TermCursorNC = "Cursor", -- Non-current terminal cursor

    -- Snacks - Indentation guides
    SnacksIndent = "Conceal", -- Normal indent
    SnacksIndentScope = "Conceal", -- Scope indent
    SnacksIndentChunk = "ModeMsg", -- Chunk indent

    -- GitHub Copilot
    CopilotSuggestion = "MoreMsg", -- Copilot suggestions

    -- Startify - Start screen plugin
    StartifyBracket = "Comment", -- Brackets around items
    StartifyFile = "Identifier", -- File names
    StartifyFooter = "Constant", -- Footer text
    StartifyHeader = "Constant", -- Header ASCII art
    StartifyNumber = "Special", -- Item numbers
    StartifyPath = "Comment", -- File paths
    StartifySection = "Statement", -- Section headers
    StartifySlash = "Comment", -- Path separators
    StartifySpecial = "Normal", -- Special characters

    -- GitSigns - Git integration for buffer
    GitSignsAdd = "DiffAdd", -- Added lines indicator
    GitSignsChange = "DiffChange", -- Changed lines indicator
    GitSignsCurrentLineBlame = "Conceal", -- Inline blame text
    GitSignsDelete = "DiffDelete", -- Deleted lines indicator

    -- NvimTree - File explorer
    NvimTreeFolderName = "NvimTreeFolderIcon", -- Folder names
    NvimTreeGitDeleted = "DiffDelete", -- Deleted files
    NvimTreeGitDirty = "DiffChange", -- Modified files
    NvimTreeGitIgnored = "Comment", -- Ignored files
    NvimTreeGitNew = "DiffNew", -- New files
    NvimTreeGitRenamed = "DiffChange", -- Renamed files
    NvimTreeGitStaged = "DiffAdd", -- Staged files

    -- CtrlP - Fuzzy file finder
    CtrlPMatch = "Title", -- Matched characters
    CtrlPMode2 = "StatusLine", -- Mode indicator
    CtrlPPrtCursor = "Cursor", -- Prompt cursor

    -- FzfLua - Lua-based fuzzy finder
    FzfLuaBorder = "FloatBorder", -- Window border

    -- Telescope - Fuzzy finder and picker
    TelescopeBorder = "FloatBorder", -- Window border

    -- WhichKey - Key binding helper
    WhichKeyBorder = "FloatBorder", -- Window border

    -- Window - General window elements
    WinSeparator = "VertSplit", -- Window separators

    -- Nvim-cmp - Autocompletion plugin
    CmpItemMenu = "Pmenu", -- Menu field's highlight group
    CmpItemKind = "Comment", -- Kind of the field
    CmpItemAbbr = "Normal", -- Unmatched characters of each completion field
    CmpItemAbbrDeprecated = "Comment", -- Unmatched characters of each deprecated completion field
    CmpItemAbbrMatch = "Special", -- Matched characters of each completion field
    CmpItemAbbrMatchFuzzy = "Special", -- Fuzzy-matched characters of each completion field

    -- CtrlSF - Search and replace tool
    ctrlsfFilename = "NvimTreeFolderIcon", -- File names
    ctrlsfLnumMatch = "NvimTreeFolderIcon", -- Line numbers
    ctrlsfMatch = "NvimTreeOpenedFile", -- Matched text
    ctrlsfSearchDone = "DiffAdd", -- Search complete
    ctrlsfSearching = "DiffDelete", -- Search in progress
    ctrlsfSelectedLine = "PmenuThumb", -- Selected line

    -- Markdown - Document formatting
    markdownBold = "Special", -- Bold text
    markdownItalic = "Identifier", -- Italic text
    markdownCode = "String", -- Inline code
    markdownCodeDelimiter = "String", -- Code block delimiters
    markdownH1 = "Title", -- Level 1 headings
    markdownH2 = "Title", -- Level 2 headings
    markdownH3 = "Title", -- Level 3 headings
    markdownH4 = "Title", -- Level 4 headings
    markdownH5 = "Title", -- Level 5 headings
    markdownH6 = "Title", -- Level 6 headings
    markdownHeadingDelimiter = "Comment", -- Heading # symbols
    markdownRule = "Comment", -- Horizontal rules
    markdownBlockquote = "Comment", -- Block quotes
    markdownLinkDelimiter = "Comment", -- Link brackets
    markdownLinkText = "Underlined", -- Link text
    markdownUrl = "Constant", -- URLs
    markdownListMarker = "Special", -- List bullets
    markdownOrderedListMarker = "Special", -- Numbered lists
    mkdNonListItemBlock = "Normal", -- Regular text blocks
    mkdListItem = "Special", -- List items
    mkdHeading = "Title", -- Headings
    mkdLink = "Underlined", -- Links
    mkdURL = "Constant", -- URLs
    mkdDelimiter = "Comment", -- Delimiters
    mkdSnippetSHELL = "String", -- Shell code snippets
    htmlItalic = "Identifier", -- HTML italic in markdown
    htmlBold = "Special", -- HTML bold in markdown

    -- Diff - File differences
    diffAdded = "DiffAdd", -- Added lines
    diffRemoved = "DiffDelete", -- Removed lines
    diffChanged = "DiffChange", -- Modified lines
    diffFile = "Title", -- File headers
    diffLine = "Comment", -- Line context info

    -- Help - Documentation
    helpHyperTextJump = "Constant", -- Clickable help links
  }

  -- Apply all highlights
  for group, config in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, config)
  end

  -- Apply all links
  for group, target in pairs(links) do
    vim.api.nvim_set_hl(0, group, { link = target })
  end

  vim.g.colors_name = name -- keep at the end
end

return M
