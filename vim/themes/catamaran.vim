"  ██████╗ █████╗ ████████╗ █████╗ ███╗   ███╗ █████╗ ██████╗  █████╗ ███╗   ██╗
" ██╔════╝██╔══██╗╚══██╔══╝██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗████╗  ██║
" ██║     ███████║   ██║   ███████║██╔████╔██║███████║██████╔╝███████║██╔██╗ ██║
" ██║     ██╔══██║   ██║   ██╔══██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║
" ╚██████╗██║  ██║   ██║   ██║  ██║██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║██║ ╚████║
"  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

let g:colors_name = expand('<sfile>:t:r')
set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

" ┌─┐┌─┐┬  ┌─┐┬─┐┌─┐
" │  │ ││  │ │├┬┘└─┐
" └─┘└─┘┴─┘└─┘┴└─└─┘

let s:foreground = { 'gui': '#dadada', 'cterm': '253' }
let s:background = { 'gui': '#26282B', 'cterm': '0' }

let s:pale = { 'gui': '#444444', 'cterm': '238' }
let s:line = { 'gui': '#303030', 'cterm': '236' }
let s:select = { 'gui': '#303030', 'cterm': '236' }
let s:noise = { 'gui': '#585858', 'cterm': '240' }
let s:black = { 'gui': '#000000', 'cterm': '16' }
let s:white = { 'gui': '#FFFFFF', 'cterm': '231' }

let s:color00 = { 'gui': '#26282B', 'cterm': '0' }
let s:color01 = { 'gui': '#EC2864', 'cterm': '167' }
let s:color02 = { 'gui': '#2ad3ba', 'cterm': '2' }
let s:color03 = { 'gui': '#FFB86C', 'cterm': '3' }
let s:color04 = { 'gui': '#45A9F9', 'cterm': '4' }
let s:color05 = { 'gui': '#e86db2', 'cterm': '5' }
let s:color06 = { 'gui': '#2fbca7', 'cterm': '66' }
let s:color07 = { 'gui': '#c6c8d1', 'cterm': '7' }

let s:color08 = { 'gui': '#676B79', 'cterm': '8' }
let s:color09 = { 'gui': '#FF4B82', 'cterm': '9' }
let s:color10 = { 'gui': '#e9ff5e', 'cterm': '10' }
let s:color11 = { 'gui': '#FFCC95', 'cterm': '11' }
let s:color12 = { 'gui': '#6FC1FF', 'cterm': '12' }
let s:color13 = { 'gui': '#ada0d3', 'cterm': '13' }
let s:color14 = { 'gui': '#87d7d7', 'cterm': '116' }
let s:color15 = { 'gui': '#f2f2f2', 'cterm': '249' }

" ┬ ┬┌┬┐┬┬  ┌─┐
" │ │ │ ││  └─┐
" └─┘ ┴ ┴┴─┘└─┘

fun! s:link (from, to)
  execute 'hi! link' a:to a:from
endfun

fun! s:highlight (group, props)
  execute 'hi' a:group
    \ 'cterm='   has_key(a:props, 'cterm') ? a:props.cterm    : 'NONE'
    \ 'gui='     has_key(a:props, 'gui')   ? a:props.gui      : 'NONE'
    \ 'guisp='   has_key(a:props, 'sp')    ? a:props.sp.gui   : 'NONE'
    \ 'ctermbg=' has_key(a:props, 'bg')    ? a:props.bg.cterm : 'NONE'
    \ 'guibg='   has_key(a:props, 'bg')    ? a:props.bg.gui   : 'NONE'
    \ 'ctermfg=' has_key(a:props, 'fg')    ? a:props.fg.cterm : 'NONE'
    \ 'guifg='   has_key(a:props, 'fg')    ? a:props.fg.gui   : 'NONE'
endfun

" ┌┐┌┌─┐┬─┐┌┬┐┌─┐┬
" ││││ │├┬┘│││├─┤│
" ┘└┘└─┘┴└─┴ ┴┴ ┴┴─┘

" jsFuncName -> Function -> Identifier
" jsFuncCall -> Function -> Identifier
" jsGlobalObjects -> Constant

call s:highlight ('Normal', { 'bg': s:background, 'fg': s:foreground })
call s:link ('Normal', 'jsFuncName')
call s:link ('Normal', 'jsFuncCall')
call s:link ('Normal', 'jsGlobalObjects')

" ┌─┐┌─┐┌─┐┬ ┬┌─┐  ┌┬┐┌─┐┌┐┌┬ ┬
" ├─┘│ │├─┘│ │├─┘  │││├┤ ││││ │
" ┴  └─┘┴  └─┘┴    ┴ ┴└─┘┘└┘└─┘

call s:highlight ('Pmenu', { 'bg': s:select, 'fg': s:noise })
call s:highlight ('PmenuSel', { 'bg': s:select, 'fg': s:color03 })
call s:highlight ('PmenuSbar', { 'bg': s:select, 'fg': s:color03 })
call s:highlight ('PmenuThumb', { 'bg': s:color03, 'fg': s:noise })

" ┬  ┬┬┌─┐┬ ┬┌─┐┬
" └┐┌┘│└─┐│ │├─┤│
"  └┘ ┴└─┘└─┘┴ ┴┴─┘

call s:highlight ('Visual', { 'bg': s:select, 'fg': s:noise })
call s:link ('Visual', 'ColorColumn')

call s:highlight ('Cursor', { 'bg': s:color03, 'fg': s:black })
call s:link ('Cursor', 'CursorColumn')
call s:link ('Cursor', 'CursorIM')
call s:link ('Cursor', 'TermCursor')
call s:link ('Cursor', 'TermCursorNC')

call s:highlight ('ErrorMsg', { 'bg': s:color01, 'fg': s:white })
call s:highlight ('WarningMsg', { 'bg': s:color03, 'fg': s:black })

call s:highlight ('CursorLine', { 'bg': s:background })
call s:highlight ('CursorLineNr', { 'bg': s:background, 'fg': s:color08 })

call s:highlight ('VertSplit', { 'bg': s:background, 'fg': s:line })
call s:link ('VertSplit', 'WinSeparator')
call s:link ('VertSplit', 'NnnVertSplit')
call s:link ('VertSplit', 'NnnWinSeparator')

call s:highlight ('SignColumn', { 'bg': s:background, 'fg': s:pale })
call s:highlight ('LineNr', { 'bg': s:background, 'fg': s:pale })
call s:link ('LineNr', 'Folded')
call s:link ('LineNr', 'FoldColumn')

call s:highlight ('DiffAdd', { 'bg': s:background, 'fg': s:color02 })
call s:highlight ('DiffChange', { 'bg': s:background, 'fg': s:color03 })
call s:highlight ('DiffDelete', { 'bg': s:background, 'fg': s:color01 })
call s:highlight ('DiffText', { 'bg': s:background, 'fg': s:foreground })

call s:highlight ('Search', { 'bg': s:color14, 'fg': s:black })
call s:highlight ('IncSearch', { 'bg': s:color03, 'fg': s:black })
" Substitute // @TODO

call s:highlight ('MatchParen', { 'bg': s:color14, 'fg': s:black })

call s:highlight ('EndOfBuffer', { 'bg': s:background, 'fg': s:pale })

" ┌─┐┌─┐┌┐┌┌─┐┌┬┐┌─┐┌┐┌┌┬┐
" │  │ ││││└─┐ │ ├─┤│││ │
" └─┘└─┘┘└┘└─┘ ┴ ┴ ┴┘└┘ ┴

" Character
" jsString -> String -> Constant
" typescriptStringS -> String -> Constant
" typescriptBoolean -> Boolean -> Constant
" typescriptNumber -> Number -> Constant

call s:highlight ('Constant', { 'bg': s:background, 'fg': s:color04 })

" @TODO
call s:highlight ('jsObjectKey', { 'bg': s:background, 'fg': s:color14 })

call s:highlight ('String', { 'bg': s:background, 'fg': s:color02 })
call s:link ('String', 'Character')
"call s:link ('String', 'Directory')

" ┬┌┐┌┌─┐┬  ┬ ┬┌┬┐┌─┐
" │││││  │  │ │ ││├┤
" ┴┘└┘└─┘┴─┘└─┘─┴┘└─┘

" typescriptReserved -> Keyword -> Statement
" jsImport -> Include -> PreProc
" jsFrom -> Include -> PreProc

" jsConditional -> Conditional -> Statement -> PreProc
" typescriptConditional -> Conditional -> Statement -> PreProc
" jsLabel -> Label -> Statement -> PreProc
" typescriptLabel -> Label -> Statement -> PreProc
" jsStatement -> Statement -> PreProc
" jsTry -> Exception -> Statement -> PreProc
" typescriptBranch -> Conditional -> Statement -> PreProc
" jsRepeat -> Repeat -> Statement -> PreProc
" typescriptRepeat -> Repeat -> Statement -> PreProc
" typescriptExceptions -> Special
" jsExceptions -> Constant

call s:highlight ('Include', { 'bg': s:background, 'fg': s:color01 })
call s:link ('Include', 'Statement')
call s:link ('Include', 'typescriptReserved')
call s:link ('Include', 'typescriptExceptions')
call s:link ('Include', 'jsExceptions')

" ┌┐┌┌─┐┬┌─┐┌─┐
" ││││ ││└─┐├┤
" ┘└┘└─┘┴└─┘└─┘

" jsModuleBraces -> Noise
" jsFuncBraces -> Noise
" jsFuncParens -> Noise
" jsParensIfElse -> jsParens -> Noise
" jsNoise -> Noise
" typescriptParens -> Operator -> Statement -> PreProc
" typescriptEndColons -> Exception -> Statement -> PreProc // SKIPPED
" typescriptBraces -> Function -> Identifier

call s:highlight ('Comment', { 'bg': s:background, 'fg': s:color08, 'cterm': 'italic', 'gui': 'italic' })
call s:highlight ('Noise', { 'bg': s:background, 'fg': s:noise })
call s:link ('Noise', 'jsIfElseBraces')
call s:link ('Noise', 'typescriptParens')
call s:link ('Noise', 'typescriptBraces')

" ┌┬┐┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┌─┐
"  │ ├┤ │││├─┘│  ├─┤ │ ├┤
"  ┴ └─┘┴ ┴┴  ┴─┘┴ ┴ ┴ └─┘

" jsTemplateBraces -> Noise
" typescriptInterpolationDelimiter -> Delimiter -> Special

call s:highlight ('jsTemplateBraces', { 'bg': s:background, 'fg': s:color05 })
call s:link ('jsTemplateBraces', 'typescriptInterpolationDelimiter')

" ┌┬┐┬ ┬┌─┐┌─┐
"  │ └┬┘├─┘├┤
"  ┴  ┴ ┴  └─┘

" jsFunction -> Type
" jsStorageClass -> StorageClass -> Type
" typescriptStorageClass -> StorageClass -> Type
" typescriptType -> Type
" jsArrowFunction -> Type
" typescriptOpSymbols -> Type
" typescriptFuncKeyword -> Function -> Identifier
" typescriptOpSymbols -> Operator -> Statement -> Include
" jsOperator -> Operator -> Statement -> Include
" tsxNotOperator -> typescriptEndColons -> Noise
" typescriptLogicSymbols -> Boolean -> Constant
" jsGlobalNodeObjects -> Constant // TODO

call s:highlight ('Type', { 'bg': s:background, 'fg': s:color03 })
call s:link ('Type', 'typescriptFuncKeyword')
call s:link ('Type', 'typescriptOpSymbols')
call s:link ('Type', 'jsOperator')
call s:link ('Type', 'tsxNotOperator')
call s:link ('Type', 'typescriptLogicSymbols')

" ─┐ ┬┌┬┐┬   ┬ ┬┌┬┐┌┬┐┬
" ┌┴┬┘││││───├─┤ │ ││││
" ┴ └─┴ ┴┴─┘ ┴ ┴ ┴ ┴ ┴┴─┘

" tsxTag -> htmlTag -> Function -> Identifier
" tsxTagName -> xmlTagName
" tsxCloseTag -> xmlEndTag -> xmlTagName
" tsxCloseTag -> xmlEndTag
" htmlEndTag -> Identifier
" htmlTagName -> htmlStatement -> Statement -> Include
" htmlSpecialTagName -> Exception -> Statement -> Include

call s:highlight ('htmlTag', { 'bg': s:background, 'fg': s:color05 })
call s:link ('htmlTag', 'xmlTagName')
call s:link ('htmlTag', 'xmlEndTag')
call s:link ('htmlTag', 'htmlEndTag')
call s:link ('htmlTag', 'htmlTagName')
call s:link ('htmlTag', 'htmlSpecialTagName')

" tsxAttrib -> htmlArg -> Type
" tsxEqual -> htmlTag
" htmlArg -> Type
call s:highlight ('tsxAttrib', { 'bg': s:background, 'fg': s:color14 })
call s:link ('tsxAttrib', 'htmlArg')

" ┌┬┐┌─┐┬─┐┬┌─┌┬┐┌─┐┬ ┬┌┐┌
" │││├─┤├┬┘├┴┐ │││ │││││││
" ┴ ┴┴ ┴┴└─┴ ┴─┴┘└─┘└┴┘┘└┘

" markdownH2 -> htmlH2 -> htmlH1 -> Title
" markdownH2Delimiter -> markdownHeadingDelimiter -> Delimiter -> Special
" markdownCodeDelimiter
" markdownCode -> markdownCodeDelimiter
" markdownListMarker -> htmlTagName -> htmlStatement -> Statement -> Include // SKIPPED
" markdownBoldDelimiter -> markdownBold -> htmlBold
" markdownItalicDelimiter -> markdownItalic -> htmlItalic

call s:highlight ('Title', { 'bg': s:background, 'fg': s:color01 })
call s:link ('Title', 'markdownHeadingDelimiter')
call s:highlight ('markdownCodeDelimiter', { 'bg': s:background, 'fg': s:pale })
call s:highlight ('markdownCode', { 'bg': s:background, 'fg': s:color08 })
call s:highlight ('htmlBold', { 'bg': s:background, 'fg': s:color03, 'cterm': 'bold', 'gui': 'bold' })
call s:highlight ('htmlItalic', { 'bg': s:background, 'fg': s:color03, 'cterm': 'italic', 'gui': 'italic' })


" // TODO
" bold is not applied in cterm
" italic is not applied in gui

" ┬ ┬┌─┐┌┬┐┬
" └┬┘├─┤││││
"  ┴ ┴ ┴┴ ┴┴─┘

" yamlBlockMappingKey -> Identifier
" dockerfileKeyword

call s:highlight ('yamlBlockMappingKey', { 'bg': s:background, 'fg': s:color01 })
call s:link ('yamlBlockMappingKey', 'dockerfileKeyword')


" dosiniLabel -> Type
" dosiniHeader

call s:highlight ('dosiniHeader', { 'bg': s:background, 'fg': s:color01 })
call s:highlight ('dosiniLabel', { 'bg': s:background, 'fg': s:color14 })
