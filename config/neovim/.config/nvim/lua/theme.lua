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
    Normal = { fg = p.base.primary_fg },     -- Default text
    NonText = { fg = p.base.secondary_bg },  -- Invisible characters (@, ~, etc.)
    Conceal = { fg = p.ui.mute },          -- Hidden/concealed text
    MoreMsg = { fg = p.semantic.primary },   -- Prompt messages
    ModeMsg = { fg = p.semantic.secondary }, -- Mode messages (-- INSERT --, etc.)

    -- Cursor
    Cursor = { bg = p.ui.cursor, fg = p.base.primary_bg }, -- Main cursor
    CursorColumn = {},                                     -- Cursor column highlight
    CursorLine = {},                                       -- Cursor line highlight
    CursorLineNr = { fg = p.semantic.focus },              -- Line number on cursor line

    -- Diff and Git highlights
    DiffAdd = { fg = p.semantic.success },    -- Added lines in diffs
    DiffChange = { fg = p.semantic.warning }, -- Changed lines in diffs
    DiffDelete = { fg = p.semantic.error },   -- Deleted lines in diffs
    DiffNew = { fg = p.semantic.success },    -- New files in diffs

    -- General UI
    NormalFloat = { bg = p.base.primary_bg, fg = p.base.secondary_fg },                               -- Text in floating windows
    FloatBorder = { fg = p.ui.border },                                                               -- Borders around floating windows
    ColorColumn = { bg = p.ui.ruler },                                                                -- Line length guidelines
    LineNr = { fg = p.base.tertiary_bg },                                                             -- Line numbers
    EndOfBuffer = { fg = p.base.tertiary_bg },                                                        -- Lines after end of buffer (~)
    SignColumn = {},                                                                                  -- Sign column for git/diagnostic signs
    StatusLine = { bg = p.ui.separator, fg = p.base.primary_fg },                                     -- Status line
    StatusLineNC = { bg = p.ui.separator, fg = p.base.primary_fg },                                   -- Inactive status line
    VertSplit = { bg = p.ui.separator, fg = p.ui.separator },                                         -- Vertical window separators
    Visual = { bg = p.semantic.focus, fg = p.base.primary_bg },                                       -- Visual mode selection
    MatchParen = { bg = p.base.secondary_bg, fg = p.semantic.primary },                               -- Matching parentheses
    FoldColumn = { fg = p.semantic.focus, bold = true },                                              -- Fold markers column (+/-)
    Folded = { fg = p.semantic.focus, italic = true },                                                -- Folded text lines
    MiniTrailspace = { bg = p.semantic.error },                                                       -- Trailing whitespace
    Error = { fg = p.semantic.error },                                                                -- General error highlights
    ErrorMsg = { fg = p.semantic.error },                                                             -- Error messages in command line
    WarningMsg = { fg = p.semantic.warning },                                                         -- Warning messages
    Question = { fg = p.semantic.focus },                                                             -- "Press ENTER" and similar prompts
    QuickFixLine = { fg = p.base.secondary_fg },                                                      -- Current line in quickfix window
    IncSearch = { bg = p.semantic.secondary, fg = p.base.primary_bg, undercurl = true, bold = true }, -- Incremental search highlighting
    Search = { bg = p.semantic.focus, fg = p.base.primary_bg, undercurl = true, bold = true },        -- Search matches

    -- Syntax elements
    Directory = { fg = p.semantic.primary },                  -- Directory names in file explorers
    Function = { fg = p.syntax.func, bold = true },           -- Function names
    Identifier = { fg = p.syntax.identifier },                -- Variable names
    Comment = { fg = p.syntax.comment },                      -- Code comments
    Constant = { fg = p.syntax.constant },                    -- Constants and literals
    Operator = { fg = p.syntax.operator },                    -- Operators (+, -, *, etc.)
    PreProc = { fg = p.syntax.preprocessor },                 -- Preprocessor directives (#include, #define)
    Special = { fg = p.syntax.special },                      -- Special characters and symbols
    Statement = { fg = p.syntax.keyword },                    -- Keywords (if, for, while, return)
    String = { fg = p.syntax.string },                        -- String literals
    Title = { fg = p.semantic.info },                         -- Titles and headings
    Todo = { bg = p.semantic.error, fg = p.base.primary_bg }, -- To do comments
    Type = { fg = p.syntax.identifier },                      -- Data types (int, string, etc.)
    Underlined = { underline = true, fg = p.ui.underline },   -- Underlined text

    -- Popup menu
    Pmenu = { bg = p.ui.separator, fg = p.base.primary_fg }, -- Popup menu background
    PmenuThumb = { bg = p.semantic.secondary },              -- Popup menu scrollbar thumb
    -- PmenuSel = { bg = p.semantic.primary, fg = p.base.primary_bg }, -- Selected popup menu item
    -- PmenuSbar = { bg = p.base.secondary_bg }, -- Popup menu scrollbar
    -- PmenuKind = { fg = p.syntax.comment }, -- Popup menu item kind
    -- PmenuKindSel = { fg = p.syntax.constant }, -- Selected popup menu item kind

    -- Spell checking
    SpellBad = { undercurl = true, sp = p.semantic.error },     -- Misspelled words
    SpellCap = { undercurl = true, sp = p.base.tertiary_fg },   -- Words needing capitalization
    SpellLocal = { undercurl = true, sp = p.base.tertiary_fg }, -- Words flagged by local dictionary
    SpellRare = { undercurl = true, sp = p.base.tertiary_fg },  -- Rare words

    -- Diagnostic texts
    DiagnosticError = { fg = p.semantic.error },  -- Error text
    DiagnosticWarn = { fg = p.semantic.warning }, -- Warning text
    DiagnosticInfo = { fg = p.semantic.info },    -- Info text
    DiagnosticHint = { fg = p.semantic.hint },    -- Hint text

    -- Diagnostic underlines
    DiagnosticUnderlineError = { undercurl = true, fg = p.semantic.error },             -- Error underline
    DiagnosticUnderlineWarn = { undercurl = true, fg = p.semantic.warning },            -- Warning underline
    DiagnosticUnderlineInfo = { undercurl = true, fg = p.semantic.info },               -- Info underline
    DiagnosticUnderlineHint = { undercurl = true, fg = p.semantic.hint },               -- Hint underline
    DiagnosticUnnecessary = { fg = p.syntax.comment, undercurl = true, italic = true }, -- Unused/unnecessary
    DiagnosticDeprecated = { undercurl = true, strikethrough = true },                  -- Deprecated code

    -- Diagnostic signs
    DiagnosticSignError = { fg = p.semantic.error },  -- Error signs (E) in gutter
    DiagnosticSignWarn = { fg = p.semantic.warning }, -- Warning signs (W) in gutter
    DiagnosticSignInfo = { fg = p.semantic.info },    -- Info signs (I) in gutter
    DiagnosticSignHint = { fg = p.semantic.hint },    -- Hint signs (H) in gutter

    -- Diagnostic flaoting windows
    DiagnosticFloatingError = { fg = p.semantic.error },  -- Error in floating window
    DiagnosticFloatingWarn = { fg = p.semantic.warning }, -- Warning in floating window
    DiagnosticFloatingInfo = { fg = p.semantic.info },    -- Info in floating window
    DiagnosticFloatingHint = { fg = p.semantic.hint },    -- Hint in floating window

    -- Diagnostic virtual texts
    DiagnosticVirtualTextError = { fg = p.semantic.error, italic = true },  -- Error virtual text
    DiagnosticVirtualTextWarn = { fg = p.semantic.warning, italic = true }, -- Warning virtual text
    DiagnosticVirtualTextInfo = { fg = p.semantic.info, italic = true },    -- Info virtual text
    DiagnosticVirtualTextHint = { fg = p.semantic.hint, italic = true },    -- Hint virtual text

    -- WhichKey
    WhichKeyDesc = { fg = p.syntax.identifier },   -- Key binding descriptions
    WhichKeyGroup = { fg = p.semantic.secondary }, -- Key binding group names
    WhichKeyIcon = { fg = p.syntax.constant },     -- Icons in which-key menu

    -- NvimTree
    NvimTreeFolderIcon = { fg = p.semantic.secondary },                              -- Folder icons in nvim-tree
    NvimTreeOpenedFile = { fg = p.semantic.primary, bold = true, underline = true }, -- Currently opened files
  }

  local links = {
    -- Snacks - Indentation guides
    SnacksIndent = "Conceal",      -- Normal indent
    SnacksIndentScope = "Conceal", -- Scope indent
    SnacksIndentChunk = "ModeMsg", -- Chunk indent

    -- GitHub Copilot
    CopilotSuggestion = "MoreMsg", -- Copilot suggestions

    -- Startify - Start screen plugin
    StartifyBracket = "Comment",   -- Brackets around items
    StartifyFile = "Identifier",   -- File names
    StartifyFooter = "Constant",   -- Footer text
    StartifyHeader = "Constant",   -- Header ASCII art
    StartifyNumber = "Special",    -- Item numbers
    StartifyPath = "Comment",      -- File paths
    StartifySection = "Statement", -- Section headers
    StartifySlash = "Comment",     -- Path separators
    StartifySpecial = "Normal",    -- Special characters

    -- GitSigns - Git integration for buffer
    GitSignsAdd = "DiffAdd",              -- Added lines indicator
    GitSignsChange = "DiffChange",        -- Changed lines indicator
    GitSignsCurrentLineBlame = "Conceal", -- Inline blame text
    GitSignsDelete = "DiffDelete",        -- Deleted lines indicator

    -- NvimTree - File explorer
    NvimTreeFolderName = "NvimTreeFolderIcon", -- Folder names
    NvimTreeGitDeleted = "DiffDelete",         -- Deleted files
    NvimTreeGitDirty = "DiffChange",           -- Modified files
    NvimTreeGitIgnored = "Comment",            -- Ignored files
    NvimTreeGitNew = "DiffNew",                -- New files
    NvimTreeGitRenamed = "DiffChange",         -- Renamed files
    NvimTreeGitStaged = "DiffAdd",             -- Staged files

    -- CtrlP - Fuzzy file finder
    CtrlPMatch = "Title",      -- Matched characters
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

    -- CtrlSF - Search and replace tool
    ctrlsfFilename = "NvimTreeFolderIcon",  -- File names
    ctrlsfLnumMatch = "NvimTreeFolderIcon", -- Line numbers
    ctrlsfMatch = "NvimTreeOpenedFile",     -- Matched text
    ctrlsfSearchDone = "DiffAdd",           -- Search complete
    ctrlsfSearching = "DiffDelete",         -- Search in progress
    ctrlsfSelectedLine = "PmenuThumb",      -- Selected line

    -- Markdown - Document formatting
    markdownBold = "Special",              -- Bold text
    markdownItalic = "Identifier",         -- Italic text
    markdownCode = "String",               -- Inline code
    markdownCodeDelimiter = "String",      -- Code block delimiters
    markdownH1 = "Title",                  -- Level 1 headings
    markdownH2 = "Title",                  -- Level 2 headings
    markdownH3 = "Title",                  -- Level 3 headings
    markdownH4 = "Title",                  -- Level 4 headings
    markdownH5 = "Title",                  -- Level 5 headings
    markdownH6 = "Title",                  -- Level 6 headings
    markdownHeadingDelimiter = "Comment",  -- Heading # symbols
    markdownRule = "Comment",              -- Horizontal rules
    markdownBlockquote = "Comment",        -- Block quotes
    markdownLinkDelimiter = "Comment",     -- Link brackets
    markdownLinkText = "Underlined",       -- Link text
    markdownUrl = "Constant",              -- URLs
    markdownListMarker = "Special",        -- List bullets
    markdownOrderedListMarker = "Special", -- Numbered lists
    mkdNonListItemBlock = "Normal",        -- Regular text blocks
    mkdListItem = "Special",               -- List items
    mkdHeading = "Title",                  -- Headings
    mkdLink = "Underlined",                -- Links
    mkdURL = "Constant",                   -- URLs
    mkdDelimiter = "Comment",              -- Delimiters
    mkdSnippetSHELL = "String",            -- Shell code snippets
    htmlItalic = "Identifier",             -- HTML italic in markdown
    htmlBold = "Special",                  -- HTML bold in markdown

    -- Completions
    CmpItemMenu = "Pmenu",             -- Source labels
    CmpItemKind = "Comment",           -- Item type indicators
    CmpItemAbbr = "Normal",            -- Main completion text
    CmpItemAbbrDeprecated = "Comment", -- Deprecated items
    CmpItemAbbrMatch = "Special",      -- Matched characters
    CmpItemAbbrMatchFuzzy = "Special", -- Fuzzy matched characters

    -- Terminal - Built-in terminal
    TermCursor = "Cursor",   -- Terminal cursor
    TermCursorNC = "Cursor", -- Non-current terminal cursor

    -- Diff - File differences
    diffAdded = "DiffAdd",      -- Added lines
    diffRemoved = "DiffDelete", -- Removed lines
    diffChanged = "DiffChange", -- Modified lines
    diffFile = "Title",         -- File headers
    diffLine = "Comment",       -- Line context info

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
