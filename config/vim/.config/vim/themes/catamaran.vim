"  ██████╗ █████╗ ████████╗ █████╗ ███╗   ███╗ █████╗ ██████╗  █████╗ ███╗   ██╗
" ██╔════╝██╔══██╗╚══██╔══╝██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗████╗  ██║
" ██║     ███████║   ██║   ███████║██╔████╔██║███████║██████╔╝███████║██╔██╗ ██║
" ██║     ██╔══██║   ██║   ██╔══██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║
" ╚██████╗██║  ██║   ██║   ██║  ██║██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║██║ ╚████║
"  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

" :help syntax
" :help highlight
" :help attr-list

let g:colors_name = expand('<sfile>:t:r')

if !has('gui_running') && &t_Co < 256
  finish
endif

hi clear
if exists('syntax_on')
  syntax reset
endif

hi ColorColumn guibg=#22282f guifg=NONE
hi Comment guifg=#424c5a
hi Conceal guibg=NONE guifg=#2e353f
hi Constant guifg=#2f97ea
hi CopilotSuggestion guibg=NONE guifg=#87d7d7
hi Cursor guibg=#F4D35E guifg=#1f242a gui=bold,underline
hi CursorColumn guibg=#a394cd guifg=#1f242a
hi CursorLine guibg=NONE guifg=NONE gui=NONE
hi CursorLineNr guibg=#22272e guifg=#3c4552
hi DiagnosticError guifg=#ff4b82
hi DiagnosticFloatingHint guibg=#1f242a guifg=#adbac7
hi DiagnosticHint guifg=#8296aa
hi DiagnosticInfo guifg=#6fc1ff
hi DiagnosticSignError guibg=#22272e guifg=#ff4b82
hi DiagnosticSignHint guibg=#22272e guifg=#8296aa
hi DiagnosticSignInfo guibg=#22272e guifg=#6fc1ff
hi DiagnosticSignWarn guibg=#22272e guifg=#f5b168
hi DiagnosticUnderlineError gui=underline guisp=#ff4b82
hi DiagnosticUnderlineHint gui=underline guisp=#8296aa
hi DiagnosticUnderlineInfo gui=underline guisp=#6fc1ff
hi DiagnosticUnderlineWarn gui=underline guisp=#f5b168
hi DiagnosticWarn guifg=#f5b168
hi DiffAdd guibg=NONE guifg=#00b196
hi DiffChange guibg=NONE guifg=#f5b168
hi DiffDelete guibg=NONE guifg=#f47067
hi DiffNew guibg=NONE guifg=#a394cd
hi Directory guifg=#04f6f6
hi EndOfBuffer guifg=#3c4552
hi Error guibg=#22272e guifg=#f47067
hi ErrorMsg guibg=#22272e guifg=#f47067
hi FloatBorder guibg=#1f242a guifg=#040506
hi FoldColumn guibg=#22272e
hi Folded guibg=#22272e
hi Function guifg=#04f6f6 gui=bold
hi Identifier guifg=#a394cd
hi Ignore guibg=NONE guifg=NONE
hi IncSearch gui=reverse guifg=NONE
hi LineNr guibg=#22272e guifg=#3c4552
hi MatchParen guibg=#1f242a guifg=#04f6f6
hi MiniTrailspace guibg=#ff4b82
hi ModeMsg guifg=#04f6f6
hi MoreMsg guifg=#04f6f6
hi NonText gui=NONE guifg=#3c4552
hi Normal guibg=NONE guifg=#e1e4e8
hi NormalFloat guibg=#1f242a guifg=#adbac7
hi NvimTreeFolderIcon guibg=NONE guifg=#e86db2
hi NvimTreeOpenedFile guifg=#04f6f6 gui=bold,underline
hi Operator guifg=#f97684
hi Pmenu guibg=#1f242a guifg=#3c4552
hi PmenuSbar guibg=#1f242a guifg=NONE
hi PmenuSel guibg=#04f6f6 guifg=#1f242a
hi PmenuThumb guibg=#e86db2 guifg=#1f242a
hi PreProc guifg=#ffcc95
hi Question  guifg=#a394cd
hi QuickFixLine guibg=#1f242a guifg=#adbac7
hi Search guibg=#3c4552 guifg=#e86db2
hi SignColumn guibg=#22272e guifg=#adbac7
hi Special guifg=#6fc1ff
hi SpellBad gui=undercurl guifg=NONE guisp=#f47067
hi SpellCap gui=undercurl guifg=NONE guisp=#8296aa
hi SpellLocal gui=undercurl guifg=NONE guisp=#8296aa
hi SpellRare gui=undercurl guifg=NONE guisp=#8296aa
hi Statement gui=None guibg=NONE guifg=#79b8ff
hi String guifg=#2bd2b9
hi TermCursorNC guibg=#a394cd guifg=#1f242a
hi Title gui=NONE guifg=#6fc1ff
hi Todo guibg=#f47067 guifg=#1f242a
hi Type gui=NONE guifg=#a394cd
hi Underlined gui=underline guifg=#00b196
hi VertSplit guibg=#1f242a guifg=#1f242a
hi Visual guibg=#a394cd guifg=#1f242a
hi WarningMsg guibg=#22272e guifg=#f5b168
hi WhichKeyDesc guifg=#a394cd
hi WhichKeyGroup guifg=#e86db2
hi WhichKeyIcon guifg=#2f97ea
hi Whitespace guifg=#22272e
hi WildMenu guibg=#22272e guifg=#04f6f6

hi! link Character String
hi! link CocBorder FloatBorder
hi! link CocCodeLens Conceal
hi! link CocErrorSign DiagnosticError
hi! link CocErrorVirtualText DiagnosticError
hi! link CocFadeOut NonText
hi! link CocHintSign DiagnosticHint
hi! link CocHintVirtualText DiagnosticHint
hi! link CocInfoSign DiagnosticHint
hi! link CocInfoVirtualText DiagnosticInfo
hi! link CocMenuSel PmenuSel
hi! link CocWarningSign DiagnosticWarn
hi! link CocWarningVirtualText DiagnosticWarn
hi! link Conditional Operator
hi! link CtrlPMatch Title
hi! link CtrlPMode2 StatusLine
hi! link CtrlPPrtCursor Cursor
hi! link Debug Special
hi! link Define PreProc
hi! link Delimiter Special
hi! link Exception Statement
hi! link FzfLuaBorder FloatBorder
hi! link FzfLuaNormal NormalFloat
hi! link GitSignsAdd DiffAdd
hi! link GitSignsChange DiffChange
hi! link GitSignsCurrentLineBlame Conceal
hi! link GitSignsDelete DiffDelete
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link NnnBorder FloatBorder
hi! link NnnNormalFloat NormalFloat
hi! link NnnWinSeparator VertSplit
hi! link NvimTreeFolderName NvimTreeFolderIcon
hi! link NvimTreeGitDeleted DiffDelete
hi! link NvimTreeGitDirty DiffChange
hi! link NvimTreeGitIgnored Comment
hi! link NvimTreeGitNew DiffNew
hi! link NvimTreeGitRenamed DiffChange
hi! link NvimTreeGitStaged DiffAdd
hi! link PreCondit PreProc
hi! link Repeat Operator
hi! link SignifySignAdd GitGutterAdd
hi! link SignifySignChange GitGutterChange
hi! link SignifySignChangeDelete GitGutterChangeDelete
hi! link SignifySignDelete GitGutterDelete
hi! link SignifySignDeleteFirstLine SignifySignDelete
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link SpecialKey Special
hi! link StartifyBracket Comment
hi! link StartifyFile Identifier
hi! link StartifyFooter Constant
hi! link StartifyHeader Constant
hi! link StartifyNumber Special
hi! link StartifyPath Comment
hi! link StartifySection Statement
hi! link StartifySlash Comment
hi! link StartifySpecial Normal
hi! link StorageClass Type
hi! link Structure Type
hi! link TSAttribute Special
hi! link TSBoolean Constant
hi! link TSCharacter Constant
hi! link TSComment Comment
hi! link TSConditional Statement
hi! link TSConstBuiltin Constant
hi! link TSConstMacro Constant
hi! link TSConstant Constant
hi! link TSConstructor Normal
hi! link TSError Error
hi! link TSException Statement
hi! link TSField Normal
hi! link TSFloat Constant
hi! link TSFuncBuiltin Function
hi! link TSFuncMacro Function
hi! link TSFunction Function
hi! link TSFunctionCall Function
hi! link TSInclude Statement
hi! link TSKeyword Statement
hi! link TSKeywordFunction Function
hi! link TSLabel Special
hi! link TSNamespace Statement
hi! link TSNumber Constant
hi! link TSOperator Normal
hi! link TSParameter Normal
hi! link TSParameterReference Normal
hi! link TSProperty TSField
hi! link TSPunctBracket Normal
hi! link TSPunctDelimiter Normal
hi! link TSPunctSpecial Special
hi! link TSRepeat Statement
hi! link TSString String
hi! link TSStringEscape Special
hi! link TSStringRegex String
hi! link TSTag htmlTagName
hi! link TSTagAttribute htmlArg
hi! link TSTagDelimiter htmlTagName
hi! link TSText Normal
hi! link TSTitle Title
hi! link TSType Type
hi! link TSTypeBuiltin Type
hi! link TSURI Underlined
hi! link TSVariable Normal
hi! link TSVariableBuiltin Statement
hi! link Tag Special
hi! link TelescopeBorder FloatBorder
hi! link TermCursor Cursor
hi! link ToolbarButton TabLineSel
hi! link ToolbarLine TabLineFill
hi! link Typedef Type
hi! link VisualNOS Visual
hi! link WhichKeyBorder FloatBorder
hi! link WinSeparator VertSplit
hi! link cssBraces Delimiter
hi! link cssClassName Special
hi! link cssClassNameDot Normal
hi! link cssPseudoClassId Special
hi! link cssTagName Statement
hi! link ctrlsfFilename NvimTreeFolderIcon
hi! link ctrlsfLnumMatch NvimTreeFolderIcon
hi! link ctrlsfMatch NvimTreeOpenedFile
hi! link ctrlsfSearchDone DiffAdd
hi! link ctrlsfSearching DiffDelete
hi! link ctrlsfSelectedLine PmenuThumb
hi! link deniteMatched Normal
hi! link deniteMatchedChar Title
hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete
hi! link elixirBlockDefinition Statement
hi! link elixirDefine Statement
hi! link elixirDocSigilDelimiter String
hi! link elixirDocTest String
hi! link elixirExUnitMacro Statement
hi! link elixirExceptionDefine Statement
hi! link elixirFunctionDeclaration Title
hi! link elixirKeyword Statement
hi! link elixirModuleDeclaration Normal
hi! link elixirModuleDefine Statement
hi! link elixirPrivateDefine Statement
hi! link elixirStringDelimiter String
hi! link gitmessengerHash Comment
hi! link gitmessengerHeader Statement
hi! link gitmessengerHistory Constant
hi! link graphqlName Normal
hi! link graphqlOperator Normal
hi! link helpHyperTextJump Constant
hi! link htmlArg Constant
hi! link htmlEndTag Statement
hi! link htmlTag Statement
hi! link jsArrowFunction Operator
hi! link jsClassDefinition Normal
hi! link jsClassFuncName Title
hi! link jsExport Statement
hi! link jsFlowMaybe Normal
hi! link jsFlowObject Normal
hi! link jsFlowType PreProc
hi! link jsFuncCall Normal
hi! link jsFuncName Title
hi! link jsFutureKeys Statement
hi! link jsGlobalObjects Statement
hi! link jsModuleKeywords Statement
hi! link jsModuleOperators Statement
hi! link jsNull Constant
hi! link jsObjectFuncName Title
hi! link jsObjectKey Identifier
hi! link jsSuper Statement
hi! link jsTemplateBraces Special
hi! link jsUndefined Constant
hi! link jsonQuote Normal
hi! link markdownBold Special
hi! link markdownCode String
hi! link markdownCodeDelimiter String
hi! link markdownHeadingDelimiter Comment
hi! link markdownRule Comment
hi! link ngxDirective Statement
hi! link phpVarSelector Identifier
hi! link plug1 Normal
hi! link plug2 Identifier
hi! link plugDash Comment
hi! link plugMessage Special
hi! link pythonFunction Title
hi! link rubyDefine Statement
hi! link rubyFunction Title
hi! link rubyInterpolationDelimiter String
hi! link rubySharpBang Comment
hi! link rubyStringDelimiter String
hi! link rustFuncCall Normal
hi! link rustFuncName Title
hi! link rustType Constant
hi! link sassClass Special
hi! link shFunction Normal
hi! link svssBraces Delimiter
hi! link swiftIdentifier Normal
hi! link typescriptAjaxMethods Normal
hi! link typescriptBraces Normal
hi! link typescriptEndColons Normal
hi! link typescriptFuncKeyword Statement
hi! link typescriptGlobalObjects Statement
hi! link typescriptHtmlElemProperties Normal
hi! link typescriptIdentifier Statement
hi! link typescriptMessage Normal
hi! link typescriptNull Constant
hi! link typescriptParens Normal
hi! link vimContinue Comment
hi! link vimFuncSID vimFunction
hi! link vimFuncVar Normal
hi! link vimFunction Title
hi! link vimGroup Statement
hi! link vimHiGroup Statement
hi! link vimHiTerm Identifier
hi! link vimMapModKey Special
hi! link vimOption Identifier
hi! link vimVar Normal
hi! link xmlAttrib Constant
hi! link xmlAttribPunct Statement
hi! link xmlEndTag Statement
hi! link xmlNamespace Statement
hi! link xmlTag Statement
hi! link xmlTagName Statement
hi! link yamlKeyValueDelimiter Delimiter
