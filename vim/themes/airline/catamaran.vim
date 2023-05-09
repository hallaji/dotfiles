
"  ██████╗ █████╗ ████████╗ █████╗ ███╗   ███╗ █████╗ ██████╗  █████╗ ███╗   ██╗
" ██╔════╝██╔══██╗╚══██╔══╝██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗████╗  ██║
" ██║     ███████║   ██║   ███████║██╔████╔██║███████║██████╔╝███████║██╔██╗ ██║
" ██║     ██╔══██║   ██║   ██╔══██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║
" ╚██████╗██║  ██║   ██║   ██║  ██║██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║██║ ╚████║
"  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

let g:airline#themes#catamaran#palette = {}

" ┌┐┌┌─┐┬─┐┌┬┐┌─┐┬
" ││││ │├┬┘│││├─┤│
" ┘└┘└─┘┴└─┴ ┴┴ ┴┴─┘

let s:N1 = [ '#281e1e', '#EEB4B3', 234, 51  ] " Section A and Z
let s:N2 = [ '#9191a9', '#2D2D34', 240, 236 ] " Section B and Y
let s:N3 = [ '#475262', '#1f242a', 238, 234 ] " Section C and X
let s:N4 = [ '#1f242a', '#F4D35E', 255, 203 ] " Section A (Modified/Paste)

let g:airline#themes#catamaran#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#catamaran#palette.normal_modified = { 'airline_a': s:N4 }

" ┬┌┐┌┌─┐┌─┐┬─┐┌┬┐
" ││││└─┐├┤ ├┬┘ │
" ┴┘└┘└─┘└─┘┴└─ ┴

let s:I1 = [ '#0E3B4F', '#C1F9CD', 17,  45  ]
let s:I2 = [ '#0E3B4F', '#8BEFC7', 255, 27  ]
let s:I3 = [ '#ffffff', '#04BEC3', 15,  17  ]
let s:I4 = [ '#ffffff', '#008492', 255, 53  ]

let g:airline#themes#catamaran#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#catamaran#palette.insert_modified = { 'airline_a': s:I4 }
let g:airline#themes#catamaran#palette.insert_paste = { 'airline_a': s:I4 }

" ┬─┐┌─┐┌─┐┬  ┌─┐┌─┐┌─┐
" ├┬┘├┤ ├─┘│  ├─┤│  ├┤
" ┴└─└─┘┴  ┴─┘┴ ┴└─┘└─┘

let s:R1 = [ '#0E3B4F', '#FFF5D9', 17, 45  ]
let s:R2 = [ '#0E3B4F', '#DDE58E', 255, 27 ]
let s:R3 = [ '#ffffff', '#9ED47B', 15, 17  ]
let s:R4 = [ '#ffffff', '#6BAD3F', 255, 53 ]

let g:airline#themes#catamaran#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#catamaran#palette.replace_modified = { 'airline_a': s:R4 }

" ┬  ┬┬┌─┐┬ ┬┌─┐┬
" └┐┌┘│└─┐│ │├─┤│
"  └┘ ┴└─┘└─┘┴ ┴┴─┘

let s:V1 = [ '#0E3B4F', '#FFEEE5', 232, 214 ]
let s:V2 = [ '#0E3B4F', '#FF9DA5', 232, 202 ]
let s:V3 = [ '#ffffff', '#FF5B6F', 15,  52  ]
let s:V4 = [ '#ffffff', '#FF003F', 255, 53  ]

let g:airline#themes#catamaran#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#catamaran#palette.visual_modified = { 'airline_a': s:V4 }

" ┬┌┐┌┌─┐┌─┐┌┬┐┬┬  ┬┌─┐   ┬   ┌─┐┌─┐┌┬┐┌┬┐┌─┐┌┐┌┌┬┐  ┬  ┬┌┐┌┌─┐
" ││││├─┤│   │ │└┐┌┘├┤   ┌┼─  │  │ │││││││├─┤│││ ││  │  ││││├┤
" ┴┘└┘┴ ┴└─┘ ┴ ┴ └┘ └─┘  └┘   └─┘└─┘┴ ┴┴ ┴┴ ┴┘└┘─┴┘  ┴─┘┴┘└┘└─┘

let s:C1 = [ '#0E3B4F', '#FEFCF9', 239, 234 ]
let s:C2 = [ '#0E3B4F', '#DDC6AF', 239, 235 ]
let s:C3 = [ '#ffffff', '#A28E79', 239, 236 ]
let s:C4 = [ '#ffffff', '#8C7B69', 239, 236 ]

let g:airline#themes#catamaran#palette.inactive = airline#themes#generate_color_map(s:N2, s:N3, s:N3)
let g:airline#themes#catamaran#palette.inactive_modified = { 'airline_a': s:C4 }

let g:airline#themes#catamaran#palette.commandline = airline#themes#generate_color_map(s:C1, s:C2, s:C3)
let g:airline#themes#catamaran#palette.commandline_modified = { 'airline_a': s:C4 }

" ┌┬┐┌─┐┬─┐┌┬┐┬┌┐┌┌─┐┬
"  │ ├┤ ├┬┘│││││││├─┤│
"  ┴ └─┘┴└─┴ ┴┴┘└┘┴ ┴┴─┘

let g:airline#themes#catamaran#palette.terminal = airline#themes#generate_color_map(s:N2, s:N3, s:N3)

" ┌┬┐┬┌─┐┌─┐┌┐┌┌─┐┌─┐┌┬┐┬┌─┐
"  │││├─┤│ ┬││││ │└─┐ │ ││
" ─┴┘┴┴ ┴└─┘┘└┘└─┘└─┘ ┴ ┴└─┘

let s:ER = [ '#1f242a', '#f47067', 234, 204 ] " Error
let s:WG = [ '#1f242a', '#f5b168', 234, 215 ] " Warning
let s:TM = [ '#3c4552', '#1f242a', 238, 234 ] " Term

let s:diagnostic = {
      \ 'airline_error': s:ER,
      \ 'airline_warning': s:WG,
      \ 'airline_term': s:TM,
      \ }

call extend(g:airline#themes#catamaran#palette.normal, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.normal_modified, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.insert, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.insert_modified, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.insert_paste, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.replace, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.replace_modified, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.visual, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.visual_modified, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.inactive, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.inactive_modified, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.commandline, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.commandline_modified, s:diagnostic)
call extend(g:airline#themes#catamaran#palette.terminal, s:diagnostic)
