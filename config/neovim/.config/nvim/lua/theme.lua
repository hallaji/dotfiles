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
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') == 1 then
    vim.cmd('syntax reset')
  end

  local highlights = {
    -- Text and visual guides
    Comment = { fg = p.syntax.comment }, -- Code comments
    Conceal = { fg = p.ui.indent }, -- Hidden/concealed text
    SnacksIndent = { fg = p.ui.indent }, -- Normal indent
    SnacksIndentScope = { fg = p.ui.indent }, -- Scope indent
    SnacksIndentChunk = { fg = p.semantic.secondary }, -- Chunk indent
    Constant = { fg = p.syntax.constant }, -- Constants and literals
    CopilotSuggestion = { fg = p.semantic.hint }, -- AI code suggestions

    -- Cursor highlights
    Cursor = { bg = p.ui.cursor, fg = p.base.secondary_bg, bold = true }, -- Main cursor
    CursorColumn = { bg = p.semantic.focus, fg = p.base.secondary_bg }, -- Current column highlight
    CursorLine = {}, -- Current line highlight
    CursorLineNr = { bg = p.base.primary_bg, fg = p.semantic.focus }, -- Line number on cursor line

    -- Diff and Git highlights
    DiffAdd = { fg = p.semantic.success }, -- Added lines in diffs
    DiffChange = { fg = p.semantic.warning }, -- Changed lines in diffs
    DiffDelete = { fg = p.semantic.error }, -- Deleted lines in diffs
    DiffNew = { fg = p.semantic.success }, -- New files in diffs

    -- General UI
    ColorColumn = { bg = p.ui.ruler, fg = p.ui.ruler }, -- Column width ruler
    LineNr = { bg = p.base.primary_bg, fg = p.base.tertiary_bg }, -- Line numbers
    FoldColumn = { bg = p.base.primary_bg, fg = p.semantic.focus, bold = true }, -- Fold markers column (+/-)
    SignColumn = { bg = p.base.primary_bg, fg = p.base.secondary_fg }, -- Sign column for git/diagnostic signs
    VertSplit = { bg = p.ui.separator, fg = p.ui.separator }, -- Vertical window separators
    StatusLine = { bg = p.ui.separator, fg = p.base.primary_fg }, -- Status line
    StatusLineNC = { bg = p.ui.separator, fg = p.base.primary_fg }, -- Inactive status line

    FloatBorder = { bg = p.ui.separator, fg = p.ui.border }, -- Borders around floating windows
    NormalFloat = { bg = p.ui.separator, fg = p.base.secondary_fg }, -- Text in floating windows

    Directory = { fg = p.semantic.primary }, -- Directory names in file explorers
    EndOfBuffer = { fg = p.base.tertiary_bg }, -- ~ lines after end of buffer
    Error = { bg = p.base.primary_bg, fg = p.semantic.error }, -- General error highlights
    ErrorMsg = { bg = p.base.primary_bg, fg = p.semantic.error }, -- Error messages in command line

    Folded = { fg = p.semantic.focus, italic = true }, -- Folded text lines
    Function = { fg = p.syntax.func, bold = true }, -- Function names
    Identifier = { fg = p.syntax.identifier }, -- Variable names
    MatchParen = { bg = p.base.secondary_bg, fg = p.semantic.primary }, -- Matching parentheses
    MiniTrailspace = { bg = p.semantic.error }, -- Trailing whitespace
    ModeMsg = { fg = p.semantic.primary }, -- Mode messages (-- INSERT --, etc.)
    MoreMsg = { fg = p.semantic.primary }, -- "Press ENTER" prompts
    NonText = { fg = p.base.tertiary_bg }, -- Invisible characters (@, ~, etc.)
    Normal = { fg = p.base.primary_fg }, -- Default text

    Question = { fg = p.syntax.identifier }, -- "Press ENTER" and similar prompts
    QuickFixLine = { bg = p.base.secondary_bg, fg = p.base.secondary_fg }, -- Current line in quickfix window

    -- Search and navigation
    IncSearch = { bg=p.semantic.secondary, fg = p.base.primary_bg, undercurl = true, bold = true }, -- Incremental search highlighting
    Search = { bg=p.semantic.focus, fg = p.base.primary_bg, undercurl = true, bold = true }, -- Search matches

    -- Plugin-specific
    NvimTreeFolderIcon = { fg = p.semantic.secondary }, -- Folder icons in nvim-tree
    NvimTreeOpenedFile = { fg = p.semantic.primary, bold = true, underline = true }, -- Currently opened files

    -- Syntax elements
    Operator = { fg = p.syntax.operator }, -- Operators (+, -, *, etc.)
    PreProc = { fg = p.syntax.preprocessor }, -- Preprocessor directives (#include, #define)
    Special = { fg = p.syntax.special }, -- Special characters and symbols
    Statement = { fg = p.syntax.keyword }, -- Keywords (if, for, while, return)
    String = { fg = p.syntax.string }, -- String literals
    Title = { fg = p.semantic.info }, -- Titles and headings
    Todo = { bg = p.semantic.error, fg = p.base.secondary_bg }, -- To do comments
    Type = { fg = p.syntax.identifier }, -- Data types (int, string, etc.)
    Underlined = { underline = true, fg = p.ui.underline }, -- Underlined text
    Visual = { bg = p.syntax.identifier, fg = p.base.secondary_bg }, -- Visual mode selection
    WarningMsg = { bg = p.base.primary_bg, fg = p.semantic.warning }, -- Warning messages
    Whitespace = { fg = p.base.primary_bg }, -- Visible whitespace characters
    WildMenu = { bg = p.base.primary_bg, fg = p.semantic.primary }, -- Command completion menu

    -- Popup menu
    Pmenu = { bg = p.base.secondary_bg, fg = p.semantic.primary }, -- Popup menu background
    PmenuSbar = { bg = p.base.secondary_bg }, -- Popup menu scrollbar
    PmenuSel = { bg = p.semantic.primary, fg = p.base.secondary_bg }, -- Selected popup menu item
    PmenuThumb = { bg = p.semantic.secondary, fg = p.base.secondary_bg }, -- Popup menu scrollbar thumb

    -- Spell checking
    SpellBad = { undercurl = true, sp = p.semantic.error }, -- Misspelled words
    SpellCap = { undercurl = true, sp = p.base.tertiary_fg }, -- Words needing capitalization
    SpellLocal = { undercurl = true, sp = p.base.tertiary_fg }, -- Words flagged by local dictionary
    SpellRare = { undercurl = true, sp = p.base.tertiary_fg }, -- Rare words

    -- Terminal
    TermCursorNC = { bg = p.syntax.identifier, fg = p.base.secondary_bg }, -- Terminal cursor when not focused

    -- WhichKey
    WhichKeyDesc = { fg = p.syntax.identifier }, -- Key binding descriptions
    WhichKeyGroup = { fg = p.semantic.secondary }, -- Key binding group names
    WhichKeyIcon = { fg = p.syntax.constant }, -- Icons in which-key menu

    -- Diagnostic text highlights (inline diagnostic messages)
    DiagnosticError = { fg = p.semantic.error }, -- Error text
    DiagnosticWarn = { fg = p.semantic.warning }, -- Warning text
    DiagnosticInfo = { fg = p.semantic.info }, -- Info text
    DiagnosticHint = { fg = p.semantic.hint }, -- Hint text

    -- Diagnostic underlines
    DiagnosticUnderlineError = { undercurl = true, fg = p.semantic.error }, -- Error underline
    DiagnosticUnderlineWarn = { undercurl = true, fg = p.semantic.warning }, -- Warning underline
    DiagnosticUnderlineInfo = { undercurl = true, fg = p.semantic.info }, -- Info underline
    DiagnosticUnderlineHint = { undercurl = true, fg = p.semantic.hint }, -- Hint underline
    DiagnosticUnnecessary = { fg = p.syntax.comment, undercurl = true, italic = true }, -- Unused/unnecessary
    DiagnosticDeprecated = { undercurl = true, strikethrough = true }, -- Deprecated code

    -- Diagnostic signs
    DiagnosticSignError = { bg = p.base.primary_bg, fg = p.semantic.error }, -- Error signs (E) in gutter
    DiagnosticSignWarn = { bg = p.base.primary_bg, fg = p.semantic.warning }, -- Warning signs (W) in gutter
    DiagnosticSignInfo = { bg = p.base.primary_bg, fg = p.semantic.info }, -- Info signs (I) in gutter
    DiagnosticSignHint = { bg = p.base.primary_bg, fg = p.semantic.hint }, -- Hint signs (H) in gutter

    -- Floating diagnostic windows
    DiagnosticFloatingError = { fg = p.semantic.error }, -- Error in floating window
    DiagnosticFloatingWarn = { fg = p.semantic.warning }, -- Warning in floating window
    DiagnosticFloatingInfo = { fg = p.semantic.info }, -- Info in floating window
    DiagnosticFloatingHint = { fg = p.semantic.hint }, -- Hint in floating window

    -- Virtual text (inline diagnostic text)
    DiagnosticVirtualTextError = { fg = p.semantic.error, italic = true }, -- Error virtual text
    DiagnosticVirtualTextWarn = { fg = p.semantic.warning, italic = true }, -- Warning virtual text
    DiagnosticVirtualTextInfo = { fg = p.semantic.info, italic = true }, -- Info virtual text
    DiagnosticVirtualTextHint = { fg = p.semantic.hint, italic = true }, -- Hint virtual text
  }

  local links = {
    -- Startify - Start screen plugin
    StartifyBracket = 'Comment', -- Brackets around items
    StartifyFile = 'Identifier', -- File names
    StartifyFooter = 'Constant', -- Footer text
    StartifyHeader = 'Constant', -- Header ASCII art
    StartifyNumber = 'Special', -- Item numbers
    StartifyPath = 'Comment', -- File paths
    StartifySection = 'Statement', -- Section headers
    StartifySlash = 'Comment', -- Path separators
    StartifySpecial = 'Normal', -- Special characters

    -- GitSigns - Git integration for buffer
    GitSignsAdd = 'DiffAdd', -- Added lines indicator
    GitSignsChange = 'DiffChange', -- Changed lines indicator
    GitSignsCurrentLineBlame = 'Conceal', -- Inline blame text
    GitSignsDelete = 'DiffDelete', -- Deleted lines indicator

    -- NvimTree - File explorer
    NvimTreeFolderName = 'NvimTreeFolderIcon', -- Folder names
    NvimTreeGitDeleted = 'DiffDelete', -- Deleted files
    NvimTreeGitDirty = 'DiffChange', -- Modified files
    NvimTreeGitIgnored = 'Comment', -- Ignored files
    NvimTreeGitNew = 'DiffNew', -- New files
    NvimTreeGitRenamed = 'DiffChange', -- Renamed files
    NvimTreeGitStaged = 'DiffAdd', -- Staged files

    -- CtrlP - Fuzzy file finder
    CtrlPMatch = 'Title', -- Matched characters
    CtrlPMode2 = 'StatusLine', -- Mode indicator
    CtrlPPrtCursor = 'Cursor', -- Prompt cursor

    -- FzfLua - Lua-based fuzzy finder
    FzfLuaBorder = 'FloatBorder', -- Window border
    FzfLuaNormal = 'NormalFloat', -- Normal text

    -- Nnn - Terminal file manager integration
    NnnBorder = 'FloatBorder', -- Window border
    NnnNormalFloat = 'NormalFloat', -- Normal text
    NnnWinSeparator = 'VertSplit', -- Window separator

    -- Telescope - Fuzzy finder and picker
    TelescopeBorder = 'FloatBorder', -- Window border

    -- WhichKey - Key binding helper
    WhichKeyBorder = 'FloatBorder', -- Window border

    -- Window - General window elements
    WinSeparator = 'VertSplit', -- Window separators

    -- CtrlSF - Search and replace tool
    ctrlsfFilename = 'NvimTreeFolderIcon', -- File names
    ctrlsfLnumMatch = 'NvimTreeFolderIcon', -- Line numbers
    ctrlsfMatch = 'NvimTreeOpenedFile', -- Matched text
    ctrlsfSearchDone = 'DiffAdd', -- Search complete
    ctrlsfSearching = 'DiffDelete', -- Search in progress
    ctrlsfSelectedLine = 'PmenuThumb', -- Selected line

    -- Markdown - Document formatting
    markdownBold = 'Special', -- Bold text
    markdownItalic = 'Identifier', -- Italic text
    markdownCode = 'String', -- Inline code
    markdownCodeDelimiter = 'String', -- Code block delimiters
    markdownH1 = 'Title', -- Level 1 headings
    markdownH2 = 'Title', -- Level 2 headings
    markdownH3 = 'Title', -- Level 3 headings
    markdownH4 = 'Title', -- Level 4 headings
    markdownH5 = 'Title', -- Level 5 headings
    markdownH6 = 'Title', -- Level 6 headings
    markdownHeadingDelimiter = 'Comment', -- Heading # symbols
    markdownRule = 'Comment', -- Horizontal rules
    markdownBlockquote = 'Comment', -- Block quotes
    markdownLinkDelimiter = 'Comment', -- Link brackets
    markdownLinkText = 'Underlined', -- Link text
    markdownUrl = 'Constant', -- URLs
    markdownListMarker = 'Special', -- List bullets
    markdownOrderedListMarker = 'Special', -- Numbered lists
    mkdNonListItemBlock = 'Normal', -- Regular text blocks
    mkdListItem = 'Special', -- List items
    mkdHeading = 'Title', -- Headings
    mkdLink = 'Underlined', -- Links
    mkdURL = 'Constant', -- URLs
    mkdDelimiter = 'Comment', -- Delimiters
    mkdSnippetSHELL = 'String', -- Shell code snippets
    htmlItalic = 'Identifier', -- HTML italic in markdown
    htmlBold = 'Special', -- HTML bold in markdown

    -- Completion - nvim-cmp autocompletion
    CmpItemKind = 'Comment', -- Item type indicators
    CmpItemAbbr = 'Normal', -- Main completion text
    CmpItemAbbrMatch = 'Special', -- Matched characters
    CmpItemMenu = 'Comment', -- Source labels

    -- Terminal - Built-in terminal
    TermCursor = 'Cursor', -- Terminal cursor

    -- Diff - File differences
    diffAdded = 'DiffAdd', -- Added lines
    diffRemoved = 'DiffDelete', -- Removed lines
    diffChanged = 'DiffChange', -- Modified lines
    diffFile = 'Title', -- File headers
    diffLine = 'Comment', -- Line context info

    -- Help - Documentation
    helpHyperTextJump = 'Constant', -- Clickable help links
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
