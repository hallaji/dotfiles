-- ██████╗ █████╗ ████████╗ █████╗ ███╗   ███╗ █████╗ ██████╗  █████╗ ███╗   ██╗
-- ██╔════╝██╔══██╗╚══██╔══╝██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗████╗  ██║
-- ██║     ███████║   ██║   ███████║██╔████╔██║███████║██████╔╝███████║██╔██╗ ██║
-- ██║     ██╔══██║   ██║   ██╔══██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║
-- ╚██████╗██║  ██║   ██║   ██║  ██║██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║██║ ╚████║
--  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

vim.g.colors_name = "catamaran"

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') == 1 then
  vim.cmd('syntax reset')
end

-- Main highlight groups
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#22282f', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'Comment', { fg = '#424c5a' })
vim.api.nvim_set_hl(0, 'Conceal', { bg = 'NONE', fg = '#2e353f' })
vim.api.nvim_set_hl(0, 'Constant', { fg = '#2f97ea' })
vim.api.nvim_set_hl(0, 'CopilotSuggestion', { bg = 'NONE', fg = '#87d7d7' })
vim.api.nvim_set_hl(0, 'Cursor', { bg = '#F4D35E', fg = '#1f242a', bold = true, underline = true })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = '#a394cd', fg = '#1f242a' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = '#22272e', fg = '#3c4552' })

-- Diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ff4b82' })
vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { bg = '#1f242a', fg = '#adbac7' })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#8296aa' })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#6fc1ff' })
vim.api.nvim_set_hl(0, 'DiagnosticSignError', { bg = '#22272e', fg = '#ff4b82' })
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { bg = '#22272e', fg = '#8296aa' })
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { bg = '#22272e', fg = '#6fc1ff' })
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { bg = '#22272e', fg = '#f5b168' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = '#ff4b82' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = true, sp = '#8296aa' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underline = true, sp = '#6fc1ff' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underline = true, sp = '#f5b168' })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#f5b168' })

-- Diffs
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = 'NONE', fg = '#00b196' })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = 'NONE', fg = '#f5b168' })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = 'NONE', fg = '#f47067' })
vim.api.nvim_set_hl(0, 'DiffNew', { bg = 'NONE', fg = '#a394cd' })

-- General UI
vim.api.nvim_set_hl(0, 'Directory', { fg = '#04f6f6' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = '#3c4552' })
vim.api.nvim_set_hl(0, 'Error', { bg = '#22272e', fg = '#f47067' })
vim.api.nvim_set_hl(0, 'ErrorMsg', { bg = '#22272e', fg = '#f47067' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#1f242a', fg = '#040506' })
vim.api.nvim_set_hl(0, 'FoldColumn', { bg = '#22272e' })
vim.api.nvim_set_hl(0, 'Folded', { bg = '#22272e' })
vim.api.nvim_set_hl(0, 'Function', { fg = '#04f6f6', bold = true })
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#a394cd' })
vim.api.nvim_set_hl(0, 'Ignore', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'IncSearch', { reverse = true, fg = 'NONE' })
vim.api.nvim_set_hl(0, 'LineNr', { bg = '#22272e', fg = '#3c4552' })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = '#1f242a', fg = '#04f6f6' })
vim.api.nvim_set_hl(0, 'MiniTrailspace', { bg = '#ff4b82' })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = '#04f6f6' })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#04f6f6' })
vim.api.nvim_set_hl(0, 'NonText', { fg = '#3c4552' })
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE', fg = '#e1e4e8' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1f242a', fg = '#adbac7' })

-- Plugin-specific
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { bg = 'NONE', fg = '#e86db2' })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFile', { fg = '#04f6f6', bold = true, underline = true })

-- Syntax elements
vim.api.nvim_set_hl(0, 'Operator', { fg = '#f97684' })
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#ffcc95' })
vim.api.nvim_set_hl(0, 'Question', { fg = '#a394cd' })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = '#1f242a', fg = '#adbac7' })
vim.api.nvim_set_hl(0, 'Search', { bg = '#3c4552', fg = '#e86db2' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#22272e', fg = '#adbac7' })
vim.api.nvim_set_hl(0, 'Special', { fg = '#6fc1ff' })
vim.api.nvim_set_hl(0, 'Statement', { bg = 'NONE', fg = '#79b8ff' })
vim.api.nvim_set_hl(0, 'String', { fg = '#2bd2b9' })
vim.api.nvim_set_hl(0, 'Title', { fg = '#6fc1ff' })
vim.api.nvim_set_hl(0, 'Todo', { bg = '#f47067', fg = '#1f242a' })
vim.api.nvim_set_hl(0, 'Type', { fg = '#a394cd' })
vim.api.nvim_set_hl(0, 'Underlined', { underline = true, fg = '#00b196' })
vim.api.nvim_set_hl(0, 'VertSplit', { bg = '#1f242a', fg = '#1f242a' })
vim.api.nvim_set_hl(0, 'Visual', { bg = '#a394cd', fg = '#1f242a' })
vim.api.nvim_set_hl(0, 'WarningMsg', { bg = '#22272e', fg = '#f5b168' })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#22272e' })
vim.api.nvim_set_hl(0, 'WildMenu', { bg = '#22272e', fg = '#04f6f6' })

-- Popup menu
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#1f242a', fg = '#04f6f6' })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#1f242a', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#04f6f6', fg = '#1f242a' })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#e86db2', fg = '#1f242a' })

-- Spell checking
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, fg = 'NONE', sp = '#f47067' })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, fg = 'NONE', sp = '#8296aa' })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, fg = 'NONE', sp = '#8296aa' })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, fg = 'NONE', sp = '#8296aa' })

-- Terminal
vim.api.nvim_set_hl(0, 'TermCursorNC', { bg = '#a394cd', fg = '#1f242a' })

-- WhichKey
vim.api.nvim_set_hl(0, 'WhichKeyDesc', { fg = '#a394cd' })
vim.api.nvim_set_hl(0, 'WhichKeyGroup', { fg = '#e86db2' })
vim.api.nvim_set_hl(0, 'WhichKeyIcon', { fg = '#2f97ea' })

-- Links (equivalent to hi! link commands)
local links = {
  -- Completion
  { 'CmpItemKind', 'Comment' },

  -- Basic syntax
  { 'Character', 'String' },
  { 'Conditional', 'Operator' },
  { 'Debug', 'Special' },
  { 'Define', 'PreProc' },
  { 'Delimiter', 'Special' },
  { 'Exception', 'Statement' },
  { 'Include', 'PreProc' },
  { 'Keyword', 'Statement' },
  { 'Label', 'Statement' },
  { 'Macro', 'PreProc' },
  { 'PreCondit', 'PreProc' },
  { 'Repeat', 'Operator' },
  { 'SpecialChar', 'Special' },
  { 'SpecialComment', 'Special' },
  { 'SpecialKey', 'Special' },
  { 'StorageClass', 'Type' },
  { 'Structure', 'Type' },
  { 'Tag', 'Special' },
  { 'Typedef', 'Type' },

  -- CtrlP
  { 'CtrlPMatch', 'Title' },
  { 'CtrlPMode2', 'StatusLine' },
  { 'CtrlPPrtCursor', 'Cursor' },

  -- FzfLua
  { 'FzfLuaBorder', 'FloatBorder' },
  { 'FzfLuaNormal', 'NormalFloat' },

  -- GitSigns
  { 'GitSignsAdd', 'DiffAdd' },
  { 'GitSignsChange', 'DiffChange' },
  { 'GitSignsCurrentLineBlame', 'Conceal' },
  { 'GitSignsDelete', 'DiffDelete' },

  -- Nnn
  { 'NnnBorder', 'FloatBorder' },
  { 'NnnNormalFloat', 'NormalFloat' },
  { 'NnnWinSeparator', 'VertSplit' },

  -- NvimTree
  { 'NvimTreeFolderName', 'NvimTreeFolderIcon' },
  { 'NvimTreeGitDeleted', 'DiffDelete' },
  { 'NvimTreeGitDirty', 'DiffChange' },
  { 'NvimTreeGitIgnored', 'Comment' },
  { 'NvimTreeGitNew', 'DiffNew' },
  { 'NvimTreeGitRenamed', 'DiffChange' },
  { 'NvimTreeGitStaged', 'DiffAdd' },

  -- Signify
  { 'SignifySignAdd', 'GitGutterAdd' },
  { 'SignifySignChange', 'GitGutterChange' },
  { 'SignifySignChangeDelete', 'GitGutterChangeDelete' },
  { 'SignifySignDelete', 'GitGutterDelete' },
  { 'SignifySignDeleteFirstLine', 'SignifySignDelete' },

  -- Startify
  { 'StartifyBracket', 'Comment' },
  { 'StartifyFile', 'Identifier' },
  { 'StartifyFooter', 'Constant' },
  { 'StartifyHeader', 'Constant' },
  { 'StartifyNumber', 'Special' },
  { 'StartifyPath', 'Comment' },
  { 'StartifySection', 'Statement' },
  { 'StartifySlash', 'Comment' },
  { 'StartifySpecial', 'Normal' },

  -- Telescope
  { 'TelescopeBorder', 'FloatBorder' },

  -- Terminal
  { 'TermCursor', 'Cursor' },

  -- Toolbar
  { 'ToolbarButton', 'TabLineSel' },
  { 'ToolbarLine', 'TabLineFill' },

  -- Visual
  { 'VisualNOS', 'Visual' },

  -- WhichKey
  { 'WhichKeyBorder', 'FloatBorder' },

  -- Window
  { 'WinSeparator', 'VertSplit' },

  -- CSS
  { 'cssBraces', 'Delimiter' },
  { 'cssClassName', 'Special' },
  { 'cssClassNameDot', 'Normal' },
  { 'cssPseudoClassId', 'Special' },
  { 'cssTagName', 'Statement' },

  -- CtrlSF
  { 'ctrlsfFilename', 'NvimTreeFolderIcon' },
  { 'ctrlsfLnumMatch', 'NvimTreeFolderIcon' },
  { 'ctrlsfMatch', 'NvimTreeOpenedFile' },
  { 'ctrlsfSearchDone', 'DiffAdd' },
  { 'ctrlsfSearching', 'DiffDelete' },
  { 'ctrlsfSelectedLine', 'PmenuThumb' },

  -- Denite
  { 'deniteMatched', 'Normal' },
  { 'deniteMatchedChar', 'Title' },

  -- Diff
  { 'diffAdded', 'DiffAdd' },
  { 'diffRemoved', 'DiffDelete' },

  -- Elixir
  { 'elixirBlockDefinition', 'Statement' },
  { 'elixirDefine', 'Statement' },
  { 'elixirDocSigilDelimiter', 'String' },
  { 'elixirDocTest', 'String' },
  { 'elixirExUnitMacro', 'Statement' },
  { 'elixirExceptionDefine', 'Statement' },
  { 'elixirFunctionDeclaration', 'Title' },
  { 'elixirKeyword', 'Statement' },
  { 'elixirModuleDeclaration', 'Normal' },
  { 'elixirModuleDefine', 'Statement' },
  { 'elixirPrivateDefine', 'Statement' },
  { 'elixirStringDelimiter', 'String' },

  -- Git messenger
  { 'gitmessengerHash', 'Comment' },
  { 'gitmessengerHeader', 'Statement' },
  { 'gitmessengerHistory', 'Constant' },

  -- GraphQL
  { 'graphqlName', 'Normal' },
  { 'graphqlOperator', 'Normal' },

  -- Help
  { 'helpHyperTextJump', 'Constant' },

  -- HTML
  { 'htmlArg', 'Constant' },
  { 'htmlEndTag', 'Statement' },
  { 'htmlTag', 'Statement' },

  -- JavaScript
  { 'jsArrowFunction', 'Operator' },
  { 'jsClassDefinition', 'Normal' },
  { 'jsClassFuncName', 'Title' },
  { 'jsExport', 'Statement' },
  { 'jsFlowMaybe', 'Normal' },
  { 'jsFlowObject', 'Normal' },
  { 'jsFlowType', 'PreProc' },
  { 'jsFuncCall', 'Normal' },
  { 'jsFuncName', 'Title' },
  { 'jsFutureKeys', 'Statement' },
  { 'jsGlobalObjects', 'Statement' },
  { 'jsModuleKeywords', 'Statement' },
  { 'jsModuleOperators', 'Statement' },
  { 'jsNull', 'Constant' },
  { 'jsObjectFuncName', 'Title' },
  { 'jsObjectKey', 'Identifier' },
  { 'jsSuper', 'Statement' },
  { 'jsTemplateBraces', 'Special' },
  { 'jsUndefined', 'Constant' },

  -- JSON
  { 'jsonQuote', 'Normal' },

  -- Markdown
  { 'markdownBold', 'Special' },
  { 'markdownCode', 'String' },
  { 'markdownCodeDelimiter', 'String' },
  { 'markdownHeadingDelimiter', 'Comment' },
  { 'markdownRule', 'Comment' },

  -- Nginx
  { 'ngxDirective', 'Statement' },

  -- PHP
  { 'phpVarSelector', 'Identifier' },

  -- Plug
  { 'plug1', 'Normal' },
  { 'plug2', 'Identifier' },
  { 'plugDash', 'Comment' },
  { 'plugMessage', 'Special' },

  -- Python
  { 'pythonFunction', 'Title' },

  -- Ruby
  { 'rubyDefine', 'Statement' },
  { 'rubyFunction', 'Title' },
  { 'rubyInterpolationDelimiter', 'String' },
  { 'rubySharpBang', 'Comment' },
  { 'rubyStringDelimiter', 'String' },

  -- Rust
  { 'rustFuncCall', 'Normal' },
  { 'rustFuncName', 'Title' },
  { 'rustType', 'Constant' },

  -- Sass
  { 'sassClass', 'Special' },

  -- Shell
  { 'shFunction', 'Normal' },

  -- SVSS
  { 'svssBraces', 'Delimiter' },

  -- Swift
  { 'swiftIdentifier', 'Normal' },

  -- TypeScript
  { 'typescriptAjaxMethods', 'Normal' },
  { 'typescriptBraces', 'Normal' },
  { 'typescriptEndColons', 'Normal' },
  { 'typescriptFuncKeyword', 'Statement' },
  { 'typescriptGlobalObjects', 'Statement' },
  { 'typescriptHtmlElemProperties', 'Normal' },
  { 'typescriptIdentifier', 'Statement' },
  { 'typescriptMessage', 'Normal' },
  { 'typescriptNull', 'Constant' },
  { 'typescriptParens', 'Normal' },

  -- Vim
  { 'vimContinue', 'Comment' },
  { 'vimFuncSID', 'vimFunction' },
  { 'vimFuncVar', 'Normal' },
  { 'vimFunction', 'Title' },
  { 'vimGroup', 'Statement' },
  { 'vimHiGroup', 'Statement' },
  { 'vimHiTerm', 'Identifier' },
  { 'vimMapModKey', 'Special' },
  { 'vimOption', 'Identifier' },
  { 'vimVar', 'Normal' },

  -- XML
  { 'xmlAttrib', 'Constant' },
  { 'xmlAttribPunct', 'Statement' },
  { 'xmlEndTag', 'Statement' },
  { 'xmlNamespace', 'Statement' },
  { 'xmlTag', 'Statement' },
  { 'xmlTagName', 'Statement' },

  -- YAML
  { 'yamlKeyValueDelimiter', 'Delimiter' },
}

-- Apply all the links
for _, link in ipairs(links) do
  vim.api.nvim_set_hl(0, link[1], { link = link[2] })
end
