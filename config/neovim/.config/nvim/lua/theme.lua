local M = {}

-- Helper to get env var with fallback
function M.get_color(env_var, fallback)
  return vim.env[env_var] or fallback
end

function M.apply(p, name)
  vim.g.colors_name = name

  -- Clear existing highlights and set color scheme name
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') == 1 then
    vim.cmd('syntax reset')
  end

  local highlights = {
    -- Text and visual guides
    ColorColumn = { bg = p.ruler }, -- Column width ruler
    Comment = { fg = p.comment }, -- Code comments
    Conceal = { fg = p.indent_line }, -- Hidden/concealed text
    Constant = { fg = p.constant }, -- Constants and literals
    CopilotSuggestion = { fg = p.hint }, -- AI code suggestions

    -- Cursor highlights
    Cursor = { bg = p.cursor, fg = p.bg_secondary, bold = true }, -- Main cursor
    CursorColumn = { bg = p.focus, fg = p.bg_secondary }, -- Current column highlight
    CursorLine = {}, -- Current line highlight
    CursorLineNr = { fg = p.focus }, -- Line number on cursor line

    -- Diff and Git highlights
    DiffAdd = { fg = p.success }, -- Added lines in diffs
    DiffChange = { fg = p.warning }, -- Changed lines in diffs
    DiffDelete = { fg = p.error }, -- Deleted lines in diffs
    DiffNew = { fg = p.success }, -- New files in diffs

    -- General UI
    Directory = { fg = p.primary }, -- Directory names in file explorers
    EndOfBuffer = { fg = p.bg_tertiary }, -- ~ lines after end of buffer
    Error = { bg = p.bg_primary, fg = p.error }, -- General error highlights
    ErrorMsg = { bg = p.bg_primary, fg = p.error }, -- Error messages in command line
    FloatBorder = { bg = p.bg_secondary, fg = p.border }, -- Borders around floating windows
    FoldColumn = { fg = p.focus, bold = true }, -- Fold markers column (+/-)
    Folded = { fg = p.focus, italic = true }, -- Folded text lines
    Function = { fg = p.func, bold = true }, -- Function names
    Identifier = { fg = p.identifier }, -- Variable names
    LineNr = { bg = p.bg_primary, fg = p.bg_tertiary }, -- Line numbers
    MatchParen = { bg = p.bg_secondary, fg = p.primary }, -- Matching parentheses
    MiniTrailspace = { bg = p.error }, -- Trailing whitespace
    ModeMsg = { fg = p.primary }, -- Mode messages (-- INSERT --, etc.)
    MoreMsg = { fg = p.primary }, -- "Press ENTER" prompts
    NonText = { fg = p.bg_tertiary }, -- Invisible characters (@, ~, etc.)
    Normal = { fg = p.fg_primary }, -- Default text
    NormalFloat = { bg = p.bg_secondary, fg = p.fg_secondary }, -- Text in floating windows
    Question = { fg = p.identifier }, -- "Press ENTER" and similar prompts
    QuickFixLine = { bg = p.bg_secondary, fg = p.fg_secondary }, -- Current line in quickfix window
    SignColumn = { bg = p.bg_primary, fg = p.fg_secondary }, -- Sign column for git/diagnostic signs

    -- Search and navigation
    IncSearch = { reverse = true }, -- Incremental search highlighting
    Search = { bg = p.search_bg, fg = p.search }, -- Search matches

    -- Tabs and status
    TabLine = { bg = p.bg_secondary, fg = p.fg_secondary }, -- Inactive tab pages
    TabLineFill = { bg = p.bg_primary }, -- Tab line background
    TabLineSel = { bg = p.primary, fg = p.bg_secondary }, -- Active tab page

    -- Plugin-specific
    NvimTreeFolderIcon = { fg = p.secondary }, -- Folder icons in nvim-tree
    NvimTreeOpenedFile = { fg = p.primary, bold = true, underline = true }, -- Currently opened files

    -- Syntax elements
    Operator = { fg = p.operator }, -- Operators (+, -, *, etc.)
    PreProc = { fg = p.preprocessor }, -- Preprocessor directives (#include, #define)
    Special = { fg = p.special }, -- Special characters and symbols
    Statement = { fg = p.keyword }, -- Keywords (if, for, while, return)
    String = { fg = p.string }, -- String literals
    Title = { fg = p.info }, -- Titles and headings
    Todo = { bg = p.error, fg = p.bg_secondary }, -- To do comments
    Type = { fg = p.identifier }, -- Data types (int, string, etc.)
    Underlined = { underline = true, fg = p.underline }, -- Underlined text
    VertSplit = { bg = p.bg_secondary, fg = p.bg_secondary }, -- Vertical window separators
    Visual = { bg = p.identifier, fg = p.bg_secondary }, -- Visual mode selection
    WarningMsg = { bg = p.bg_primary, fg = p.warning }, -- Warning messages
    Whitespace = { fg = p.bg_primary }, -- Visible whitespace characters
    WildMenu = { bg = p.bg_primary, fg = p.primary }, -- Command completion menu

    -- Popup menu
    Pmenu = { bg = p.bg_secondary, fg = p.primary }, -- Popup menu background
    PmenuSbar = { bg = p.bg_secondary }, -- Popup menu scrollbar
    PmenuSel = { bg = p.primary, fg = p.bg_secondary }, -- Selected popup menu item
    PmenuThumb = { bg = p.secondary, fg = p.bg_secondary }, -- Popup menu scrollbar thumb

    -- Spell checking
    SpellBad = { undercurl = true, sp = p.error }, -- Misspelled words
    SpellCap = { undercurl = true, sp = p.fg_tertiary }, -- Words needing capitalization
    SpellLocal = { undercurl = true, sp = p.fg_tertiary }, -- Words flagged by local dictionary
    SpellRare = { undercurl = true, sp = p.fg_tertiary }, -- Rare words

    -- Terminal
    TermCursorNC = { bg = p.identifier, fg = p.bg_secondary }, -- Terminal cursor when not focused

    -- WhichKey
    WhichKeyDesc = { fg = p.identifier }, -- Key binding descriptions
    WhichKeyGroup = { fg = p.secondary }, -- Key binding group names
    WhichKeyIcon = { fg = p.constant }, -- Icons in which-key menu

    -- Diagnostic text highlights (inline diagnostic messages)
    DiagnosticError = { fg = p.error }, -- Error text
    DiagnosticWarn = { fg = p.warning }, -- Warning text
    DiagnosticInfo = { fg = p.info }, -- Info text
    DiagnosticHint = { fg = p.hint }, -- Hint text

    -- Diagnostic underlines
    DiagnosticUnderlineError = { undercurl = true, fg = p.error }, -- Error underline
    DiagnosticUnderlineWarn = { undercurl = true, fg = p.warning }, -- Warning underline
    DiagnosticUnderlineInfo = { undercurl = true, fg = p.info }, -- Info underline
    DiagnosticUnderlineHint = { undercurl = true, fg = p.hint }, -- Hint underline
    DiagnosticUnnecessary = { fg = p.comment, undercurl = true, italic = true }, -- Unused/unnecessary
    DiagnosticDeprecated = { undercurl = true, strikethrough = true }, -- Deprecated code

    -- Diagnostic signs
    DiagnosticSignError = { bg = p.bg_primary, fg = p.error }, -- Error signs (E) in gutter
    DiagnosticSignWarn = { bg = p.bg_primary, fg = p.warning }, -- Warning signs (W) in gutter
    DiagnosticSignInfo = { bg = p.bg_primary, fg = p.info }, -- Info signs (I) in gutter
    DiagnosticSignHint = { bg = p.bg_primary, fg = p.hint }, -- Hint signs (H) in gutter

    -- Floating diagnostic windows
    DiagnosticFloatingError = { fg = p.error }, -- Error in floating window
    DiagnosticFloatingWarn = { fg = p.warning }, -- Warning in floating window
    DiagnosticFloatingInfo = { fg = p.info }, -- Info in floating window
    DiagnosticFloatingHint = { fg = p.hint }, -- Hint in floating window

    -- Virtual text (inline diagnostic text)
    DiagnosticVirtualTextError = { fg = p.error, italic = true }, -- Error virtual text
    DiagnosticVirtualTextWarn = { fg = p.warning, italic = true }, -- Warning virtual text
    DiagnosticVirtualTextInfo = { fg = p.info, italic = true }, -- Info virtual text
    DiagnosticVirtualTextHint = { fg = p.hint, italic = true }, -- Hint virtual text
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
end

return M
