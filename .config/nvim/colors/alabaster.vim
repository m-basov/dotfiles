set background=light
highlight clear
syntax reset
let g:colors_name="alabaster"

"-------------
" Colors table
"-------------
let s:alabaster_colors = {
  \ "default"       : { "gui": "NONE",    "cterm16": "NONE" },
  \
  \ "black"         : { "gui": "#000000", "cterm16": 0      },
  \ "red"           : { "gui": "#AA3731", "cterm16": 1      },
  \ "green"         : { "gui": "#448C27", "cterm16": 2      },
  \ "yellow"        : { "gui": "#CB9000", "cterm16": 3      },
  \ "blue"          : { "gui": "#325CC0", "cterm16": 4      },
  \ "magenta"       : { "gui": "#7A3E9D", "cterm16": 5      },
  \ "cyan"          : { "gui": "#0083B2", "cterm16": 6      },
  \ "white"         : { "gui": "#BBBBBB", "cterm16": 7      },
  \ 
  \ "bright_black"  : { "gui": "#777777", "cterm16": 8      },
  \ "bright_red"    : { "gui": "#F05050", "cterm16": 9      },
  \ "bright_green"  : { "gui": "#60CB00", "cterm16": 10     },
  \ "bright_yellow" : { "gui": "#FFBC5D", "cterm16": 11     },
  \ "bright_blue"   : { "gui": "#007ACC", "cterm16": 12     },
  \ "bright_magenta": { "gui": "#E64CE6", "cterm16": 13     },
  \ "bright_cyan"   : { "gui": "#00AACB", "cterm16": 14     },
  \ "bright_white"  : { "gui": "#FFFFFF", "cterm16": 15     },
  \
  \ "lighter_grey"  : { "gui": "#F7F7F7", "cterm16": 16     },
  \ "active"        : { "gui": "#007ACC", "cterm16": 17     },
  \ "light_grey"    : { "gui": "#F0F0F0", "cterm16": 18     },
  \ "selection"     : { "gui": "#BFDBFE", "cterm16": 19     },
  \ "light_yellow"  : { "gui": "#ffddad", "cterm16": 20     },
  \ "light_red"     : { "gui": "#EDD0CE", "cterm16": 21     },
  \ }

function! alabaster#GetColors()
  return s:alabaster_colors
endfunction

function! s:h(group, style)
  let l:fg  = has_key(a:style, "fg")  ? s:alabaster_colors[a:style.fg] : s:alabaster_colors.default
  let l:bg  = has_key(a:style, "bg")  ? s:alabaster_colors[a:style.bg] : s:alabaster_colors.default
  let l:sp  = has_key(a:style, "sp")  ? a:style.sp                     : "NONE"
  let l:gui = has_key(a:style, "gui") ? a:style.gui                    : "NONE"

  execute "highlight" a:group
    \ "guifg="  .l:fg.gui
    \ "guibg="  .l:bg.gui
    \ "guisp="  .l:sp.gui
    \ "gui="    .l:gui
    \ "ctermfg=".l:fg.cterm16
    \ "ctermbg=".l:bg.cterm16
    \ "cterm="  .l:gui
endfunction

"-----------
" Vim Colors 
"-----------
call s:h("Normal"      , { "fg": "black", "bg": "lighter_grey" })
call s:h("Cursor"      , { "fg": "bright_white", "bg": "active" })
call s:h("CursorLine"  , { "bg": "light_grey" })
call s:h("StatusLine"  , { "fg": "bright_white", "bg": "blue" })
call s:h("MatchParen"  , { "fg": "active", "gui": "underline" })
call s:h("Visual"      , { "bg": "selection" })
call s:h("Search"      , { "fg": "black", "bg": "bright_yellow" })
call s:h("IncSearch"   , { "fg": "black", "bg": "bright_yellow" })
call s:h("Comment"     , { "fg": "red" })
call s:h("String"      , { "fg": "green" })
call s:h("Constant"    , { "fg": "magenta" })
call s:h("Special"     , { "fg": "black" })
call s:h("Error"       , { "fg": "red", "bg": "light_red" })
call s:h("ErrorMsg"    , { "fg": "red", "bg": "light_red" })
call s:h("Statement"   , { "fg": "black" })
call s:h("Identifier"  , { "fg": "black" })
call s:h("PreProc"     , { "fg": "black" })
call s:h("Type"        , { "fg": "black" })
call s:h("StatusLineNC", { "fg": "black", "bg": "light_grey" })
call s:h("Pmenu"       , { "fg": "bright_black", "bg": "light_grey" })
call s:h("PmenuSel"    , { "fg": "black", "bg": "white" })
call s:h("VertSplit"   , { "fg": "light_grey", "bg": "white" })
call s:h("SignColumn"  , { "fg": "black", "bg": "lighter_grey" })

"----------------------
" JavaScript/TypeScript
"----------------------
call s:h("javascriptNumber"          , { "fg": "magenta" })
call s:h("javascriptClassName"       , { "fg": "blue" })
call s:h("javascriptIdentifierName"  , { "fg": "blue" })
call s:h("typescriptTypeReference"   , { "fg": "blue" })
call s:h("typescriptBlock"           , { "fg": "blue" })
call s:h("typescriptAliasDeclaration", { "fg": "blue" })
call s:h("typescriptSpecial"         , { "fg": "bright_black" })
call s:h("typescriptInterfaceName"   , { "fg": "blue" })
call s:h("typescriptClassName"       , { "fg": "blue" })
call s:h("graphqlName"               , { "fg": "blue" })
call s:h("graphqlType"               , { "fg": "magenta" })
call s:h("tsxIntrinsicTagName"       , { "fg": "blue" })
call s:h("tsxTagName"                , { "fg": "blue" })

"----------------------
" VimL
"----------------------
call s:h("vimFunction", { "fg": "blue" })
call s:h("vimCommand" , { "fg": "blue" })
call s:h("vimLet"     , { "fg": "black" })

"----------------------
" FZF
"----------------------
call s:h("fzf1", { "fg": "bright_white", "bg": "blue" })
call s:h("fzf2", { "fg": "bright_white", "bg": "blue" })
call s:h("fzf3", { "fg": "bright_white", "bg": "blue" })

"----------------------
" ALE + TS
"----------------------
call s:h("NeomakeErrorSign"  , { "fg": "red", "bg": "light_red" })
call s:h("NeomakeWarningSign", { "fg": "yellow", "bg": "light_yellow" })
call s:h("NeomakeInfoSign"   , { "fg": "blue", "bg": "selection" })
call s:h("ALEErrorSign"      , { "fg": "red", "bg": "light_red" })
call s:h("ALEError"          , { "fg": "red", "bg": "light_red" })
call s:h("ALEWarningSign"    , { "fg": "yellow", "bg": "light_yellow" })
call s:h("ALEWarning"        , { "fg": "yellow", "bg": "light_yellow" })

