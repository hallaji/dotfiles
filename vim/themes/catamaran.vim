
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

hi CatamaranNormal ctermfg=250 guifg=#adbac7

hi ColorColumn cterm=NONE ctermbg=234 ctermfg=NONE guibg=#22282f guifg=NONE
hi Cursor ctermbg=140 ctermfg=234 guibg=#a394cd guifg=#1f242a gui=bold,underline
hi CursorColumn cterm=NONE ctermbg=140 ctermfg=234 guibg=#a394cd guifg=#1f242a
hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE gui=NONE
hi CursorLineNr cterm=NONE ctermbg=235 ctermfg=238 guibg=#22272e guifg=#3c4552
hi FoldColumn ctermbg=235 guibg=#22272e
hi Folded ctermbg=235 ctermfg=245 guibg=#22272e
hi LineNr ctermbg=235 ctermfg=238 guibg=#22272e guifg=#3c4552
hi QuickFixLine ctermbg=234 ctermfg=250 guibg=#1f242a guifg=#adbac7
hi SignColumn ctermbg=235 ctermfg=250 guibg=#22272e guifg=#adbac7
hi TermCursorNC ctermbg=140 ctermfg=234 guibg=#a394cd guifg=#1f242a
hi CopilotSuggestion ctermfg=140 gui=NONE guifg=#87d7d7

hi Comment ctermfg=238 guifg=#3c4552
hi Conceal ctermbg=NONE ctermfg=237 guibg=NONE guifg=#2e353f
hi! link CocCodeLens Conceal
hi! link GitSignsCurrentLineBlame Conceal

hi Constant ctermfg=32 guifg=#2f97ea
hi String ctermfg=43 guifg=#2bd2b9
hi! link Character String

hi Operator ctermfg=203 guifg=#f47067
hi! link Conditional Operator
hi! link Repeat Operator
hi Statement cterm=None ctermbg=None ctermfg=169 gui=None guibg=NONE guifg=#e86db2
hi! link Keyword Statement
hi! link Exception Statement
hi! link Label Statement

hi Function ctermfg=51 guifg=#04f6f6 gui=bold
hi Identifier ctermfg=140 guifg=#a394cd

hi PreProc ctermfg=222 guifg=#ffcc95
hi! link Define PreProc
hi! link Include PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc

hi Type ctermfg=140 gui=NONE guifg=#a394cd
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

hi DiffAdd ctermbg=NONE ctermfg=43 guibg=NONE guifg=#00b196
hi DiffChange ctermbg=NONE ctermfg=215 guibg=NONE guifg=#f5b168
hi DiffDelete ctermbg=NONE ctermfg=203 guibg=NONE guifg=#f47067
hi DiffNew ctermbg=NONE ctermfg=140 guibg=NONE guifg=#a394cd

hi! link GitSignsAdd DiffAdd
hi! link GitSignsChange DiffChange
hi! link GitSignsDelete DiffDelete
hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete

hi! link NvimTreeGitDirty DiffChange
hi! link NvimTreeGitStaged DiffAdd
hi! link NvimTreeGitRenamed DiffChange
hi! link NvimTreeGitNew DiffNew
hi! link NvimTreeGitDeleted DiffDelete
hi! link NvimTreeGitIgnored Comment

hi NvimTreeFolderIcon ctermbg=None ctermfg=169 guibg=NONE guifg=#e86db2
hi! link NvimTreeFolderName NvimTreeFolderIcon
hi! link NvimTreeOpenedFile Cursor

hi IncSearch cterm=reverse ctermfg=NONE gui=reverse guifg=NONE term=reverse
hi Search ctermbg=238 ctermfg=169 guibg=#3c4552 guifg=#e86db2
hi MiniTrailspace ctermbg=204 guibg=#ff4b82

hi Directory ctermfg=51 guifg=#04f6f6
hi EndOfBuffer ctermfg=238 guifg=#3c4552
hi Error ctermbg=235 ctermfg=203 guibg=#22272e guifg=#f47067
hi ErrorMsg ctermbg=235 ctermfg=203 guibg=#22272e guifg=#f47067
hi Ignore ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi MatchParen ctermbg=234 ctermfg=51 guibg=#1f242a guifg=#04f6f6
hi ModeMsg ctermfg=51 guifg=#04f6f6
hi MoreMsg ctermfg=51 guifg=#04f6f6
hi NonText ctermfg=238 gui=NONE guifg=#3c4552
hi Question ctermfg=140 guifg=#a394cd
hi Title ctermfg=75 gui=NONE guifg=#6fc1ff
hi Todo ctermbg=203 ctermfg=234 guibg=#f47067 guifg=#1f242a
hi Underlined cterm=underline ctermfg=36 gui=underline guifg=#00b196 term=underline
hi Whitespace ctermfg=235 guifg=#22272e
hi WarningMsg ctermbg=234 ctermfg=215 guibg=#22272e guifg=#f5b168

hi FloatBorder ctermbg=234 ctermfg=16 guibg=#1f242a guifg=#040506
hi Normal ctermbg=235 ctermfg=250 guibg=#22272e guifg=#adbac7
hi NormalFloat ctermbg=234 ctermfg=250 guibg=#1f242a guifg=#adbac7
hi Pmenu ctermbg=234 ctermfg=238 guibg=#1f242a guifg=#3c4552
hi PmenuSbar ctermbg=234 ctermfg=NONE guibg=#1f242a guifg=NONE
hi PmenuSel ctermbg=51 ctermfg=234 guibg=#04f6f6 guifg=#1f242a
hi PmenuThumb ctermbg=169 ctermfg=NONE guibg=#e86db2 guifg=NONE
hi VertSplit ctermbg=234 ctermfg=234 guibg=#1f242a guifg=#1f242a
hi Visual ctermbg=234 ctermfg=140 guibg=#1f242a guifg=#a394cd
hi WildMenu ctermbg=234 ctermfg=51 guibg=#22272e guifg=#04f6f6
hi! link CocMenuSel PmenuSel
hi! link FzfLuaBorder FloatBorder
hi! link FzfLuaNormal NormalFloat
hi! link NnnBorder FloatBorder
hi! link NnnNormalFloat NormalFloat
hi! link VisualNOS Visual
hi! link WinSeparator VertSplit
hi! link NnnWinSeparator VertSplit

hi Special ctermfg=75 guifg=#6fc1ff
hi! link Debug Special
hi! link Delimiter Special
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link SpecialKey Special
hi! link Tag Special

hi DiagnosticFloatingHint ctermbg=234 ctermfg=250 guibg=#1f242a guifg=#adbac7
hi DiagnosticError ctermfg=204 guifg=#ff4b82
hi DiagnosticHint ctermfg=103 guifg=#8296aa
hi DiagnosticInfo ctermfg=75 guifg=#6fc1ff
hi DiagnosticWarn ctermfg=215 guifg=#f5b168
hi DiagnosticSignError ctermbg=235 ctermfg=204 guibg=#22272e guifg=#ff4b82
hi DiagnosticSignHint ctermbg=235 ctermfg=103 guibg=#22272e guifg=#8296aa
hi DiagnosticSignInfo ctermbg=235 ctermfg=75 guibg=#22272e guifg=#6fc1ff
hi DiagnosticSignWarn ctermbg=235 ctermfg=215 guibg=#22272e guifg=#f5b168
hi DiagnosticUnderlineError cterm=underline ctermfg=204 gui=underline guisp=#ff4b82 term=underline
hi DiagnosticUnderlineHint cterm=underline ctermfg=103 gui=underline guisp=#8296aa term=underline
hi DiagnosticUnderlineInfo cterm=underline ctermfg=75 gui=underline guisp=#6fc1ff term=underline
hi DiagnosticUnderlineWarn cterm=underline ctermfg=215 gui=underline guisp=#f5b168 term=underline

hi! link CocErrorSign DiagnosticError
hi! link CocHintSign DiagnosticHint
hi! link CocInfoSign DiagnosticHint
hi! link CocWarningSign DiagnosticWarn
hi! link CocFadeOut NonText
hi! link CocInfoVirtualText DiagnosticInfo
hi! link CocWarningVirtualText DiagnosticWarn
hi! link CocErrorVirtualText DiagnosticError
hi! link CocHintVirtualText DiagnosticHint

" @TODO:
" *CocFadeOut* for faded out text, such as for highlighting unnecessary code.
" *CocErrorSign* for error signs.
" *CocWarningSign* for warning signs.
" *CocInfoSign* for information signs.
" *CocHintSign* for hint signs.
" *CocErrorHighlight* for error code range.
" *CocWarningHighlight* for warning code range.
" *CocInfoHighlight* for information code range.
" *CocHintHighlight* for hint code range.
" *CocDeprecatedHighlight* for deprecated code range, links to |CocStrikeThrough| by default.
" *CocUnusedHighlight* for unnecessary code range, links to |CocFadeOut| by default.
" *CocErrorLine* line highlight of sign which contains error.
" *CocWarningLine* line highlight of sign which contains warning.
" *CocInfoLine* line highlight of sign which information.
" *CocHintLine* line highlight of sign which contains hint.

hi SpellBad ctermbg=203 ctermfg=234 gui=undercurl guifg=NONE guisp=#f47067
hi SpellCap ctermbg=103 ctermfg=234 gui=undercurl guifg=NONE guisp=#8296aa
hi SpellLocal ctermbg=103 ctermfg=234 gui=undercurl guifg=NONE guisp=#8296aa
hi SpellRare ctermbg=103 ctermfg=234 gui=undercurl guifg=NONE guisp=#8296aa

hi! link CtrlPMatch Title
hi! link CtrlPMode2 StatusLine
hi! link CtrlPPrtCursor Cursor
hi! link SignifySignAdd GitGutterAdd
hi! link SignifySignChange GitGutterChange
hi! link SignifySignChangeDelete GitGutterChangeDelete
hi! link SignifySignDelete GitGutterDelete
hi! link SignifySignDeleteFirstLine SignifySignDelete
hi! link StartifyBracket Comment
hi! link StartifyFile Identifier
hi! link StartifyFooter Constant
hi! link StartifyHeader Constant
hi! link StartifyNumber Special
hi! link StartifyPath Comment
hi! link StartifySection Statement
hi! link StartifySlash Comment
hi! link StartifySpecial CatamaranNormal
hi! link TSAttribute Special
hi! link TSBoolean Constant
hi! link TSCharacter Constant
hi! link TSComment Comment
hi! link TSConditional Statement
hi! link TSConstBuiltin Constant
hi! link TSConstMacro Constant
hi! link TSConstant Constant
hi! link TSConstructor CatamaranNormal
hi! link TSError Error
hi! link TSException Statement
hi! link TSField CatamaranNormal
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
hi! link TSOperator CatamaranNormal
hi! link TSParameter CatamaranNormal
hi! link TSParameterReference CatamaranNormal
hi! link TSProperty TSField
hi! link TSPunctBracket CatamaranNormal
hi! link TSPunctDelimiter CatamaranNormal
hi! link TSPunctSpecial Special
hi! link TSRepeat Statement
hi! link TSString String
hi! link TSStringEscape Special
hi! link TSStringRegex String
hi! link TSTag htmlTagName
hi! link TSTagAttribute htmlArg
hi! link TSTagDelimiter htmlTagName
hi! link TSText CatamaranNormal
hi! link TSTitle Title
hi! link TSType Type
hi! link TSTypeBuiltin Type
hi! link TSURI Underlined
hi! link TSVariable CatamaranNormal
hi! link TSVariableBuiltin Statement
hi! link TermCursor Cursor
hi! link ToolbarButton TabLineSel
hi! link ToolbarLine TabLineFill
hi! link cssBraces Delimiter
hi! link cssClassName Special
hi! link cssClassNameDot CatamaranNormal
hi! link cssPseudoClassId Special
hi! link cssTagName Statement
hi! link deniteMatched CatamaranNormal
hi! link deniteMatchedChar Title
hi! link elixirBlockDefinition Statement
hi! link elixirDefine Statement
hi! link elixirDocSigilDelimiter String
hi! link elixirDocTest String
hi! link elixirExUnitMacro Statement
hi! link elixirExceptionDefine Statement
hi! link elixirFunctionDeclaration Title
hi! link elixirKeyword Statement
hi! link elixirModuleDeclaration CatamaranNormal
hi! link elixirModuleDefine Statement
hi! link elixirPrivateDefine Statement
hi! link elixirStringDelimiter String
hi! link gitmessengerHash Comment
hi! link gitmessengerHeader Statement
hi! link gitmessengerHistory Constant
hi! link graphqlName CatamaranNormal
hi! link graphqlOperator CatamaranNormal
hi! link helpHyperTextJump Constant
hi! link htmlArg Constant
hi! link htmlEndTag Statement
hi! link htmlTag Statement
hi! link jsArrowFunction Operator
hi! link jsClassDefinition CatamaranNormal
hi! link jsClassFuncName Title
hi! link jsExport Statement
hi! link jsFlowMaybe CatamaranNormal
hi! link jsFlowObject CatamaranNormal
hi! link jsFlowType PreProc
hi! link jsFuncCall CatamaranNormal
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
hi! link jsonQuote CatamaranNormal
hi! link markdownBold Special
hi! link markdownCode String
hi! link markdownCodeDelimiter String
hi! link markdownHeadingDelimiter Comment
hi! link markdownRule Comment
hi! link ngxDirective Statement
hi! link phpVarSelector Identifier
hi! link plug1 CatamaranNormal
hi! link plug2 Identifier
hi! link plugDash Comment
hi! link plugMessage Special
hi! link pythonFunction Title
hi! link rubyDefine Statement
hi! link rubyFunction Title
hi! link rubyInterpolationDelimiter String
hi! link rubySharpBang Comment
hi! link rubyStringDelimiter String
hi! link rustFuncCall CatamaranNormal
hi! link rustFuncName Title
hi! link rustType Constant
hi! link sassClass Special
hi! link shFunction CatamaranNormal
hi! link svssBraces Delimiter
hi! link swiftIdentifier CatamaranNormal
hi! link typescriptAjaxMethods CatamaranNormal
hi! link typescriptBraces CatamaranNormal
hi! link typescriptEndColons CatamaranNormal
hi! link typescriptFuncKeyword Statement
hi! link typescriptGlobalObjects Statement
hi! link typescriptHtmlElemProperties CatamaranNormal
hi! link typescriptIdentifier Statement
hi! link typescriptMessage CatamaranNormal
hi! link typescriptNull Constant
hi! link typescriptParens CatamaranNormal
hi! link vimContinue Comment
hi! link vimFuncSID vimFunction
hi! link vimFuncVar CatamaranNormal
hi! link vimFunction Title
hi! link vimGroup Statement
hi! link vimHiGroup Statement
hi! link vimHiTerm Identifier
hi! link vimMapModKey Special
hi! link vimOption Identifier
hi! link vimVar CatamaranNormal
hi! link xmlAttrib Constant
hi! link xmlAttribPunct Statement
hi! link xmlEndTag Statement
hi! link xmlNamespace Statement
hi! link xmlTag Statement
hi! link xmlTagName Statement
hi! link yamlKeyValueDelimiter Delimiter
