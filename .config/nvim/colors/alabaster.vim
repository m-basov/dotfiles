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
call s:h("Definition"  , { "fg": "blue" })
call s:h("Comment"     , { "fg": "red" })
call s:h("String"      , { "fg": "green" })
call s:h("Constant"    , { "fg": "magenta" })
call s:h("Escape"      , { "fg": "bright_black" })
call s:h("Cursor"      , { "fg": "bright_white", "bg": "active" })
call s:h("CursorLine"  , { "bg": "light_grey" })
call s:h("StatusLine"  , { "fg": "bright_white", "bg": "blue" })
call s:h("MatchParen"  , { "fg": "active", "gui": "underline" })
call s:h("Visual"      , { "bg": "selection" })
call s:h("Search"      , { "fg": "black", "bg": "bright_yellow" })
call s:h("IncSearch"   , { "fg": "black", "bg": "bright_yellow" })
call s:h("Error"       , { "fg": "red", "bg": "light_red" })
call s:h("Warning"     , { "fg": "yellow", "bg": "light_yellow" })
call s:h("Pmenu"       , { "fg": "bright_black", "bg": "light_grey" })
call s:h("PmenuSel"    , { "fg": "black", "bg": "white" })
call s:h("VertSplit"   , { "fg": "light_grey", "bg": "white" })
call s:h("StatusLineNC", { "fg": "black", "bg": "light_grey" })
call s:h("SignColumn"  , { "fg": "black", "bg": "lighter_grey" })
call s:h("Todo"        , { "fg": "black", "bg": "bright_yellow" })
call s:h("Underlined"  , { "fg": "blue", "gui": "underline" })

hi! def link ErrorMsg Error
hi! def link WarningMsg Warning
hi! def link NvimInternalError Error
hi! def link Statement Normal
hi! def link Identifier Normal
hi! def link PreProc Normal
hi! def link Type Normal
hi! def link Special Normal
hi! def link TermCursor Cursor
hi! def link Title Definition
hi! def link ColorColumn Normal

"----------------------
" JavaScript/TypeScript/CSS/GraphQL
"----------------------
hi! def link graphqlType Definition

hi! def link javascriptNumber Constant
hi! def link javascriptClassName Definition
hi! def link javascriptIdentifierName Definition
hi! def link jsGlobalNodeObjects Normal

hi! def link typescriptTypeReference Definition
hi! def link typescriptAliasDeclaration Definition
hi! def link typescriptInterfaceName Definition
hi! def link typescriptClassName Definition
hi! def link typescriptTypeParameter Definition
hi! def link typescriptSpecial Escape
hi! def link typescriptPredefinedType Definition
hi! def link typescriptFuncName Definition

hi! def link jsxComponentName Definition
hi! def link jsxOpenPunct Escape
hi! def link jsxClosePunct Escape
hi! def link jsxCloseString Escape

hi! def link cssClassName Definition
hi! def link cssClassNameDot Definition
hi! def link lessClass Definition
hi! def link cssTagName Definition
hi! def link cssBraces Escape
hi! def link lessNestedSelector Definition
hi! def link cssTextAttr Normal
hi! def link cssUIAttr Normal
hi! def link cssPositioningAttr Normal
hi! def link cssFlexibleBoxAttr Normal

"----------------------
" Rust
"----------------------
hi! def link rustFuncName Definition
hi! def link rustIdentifier Definition
hi! def link rustType Definition
hi! def link rustEnumVariant Definition
hi! def link rustMacro Definition
hi! def link rustFoldBraces Escape
hi! def link rustEscape Escape
hi! def link rustAttribute Escape
hi! def link rustDerive Escape
hi! def link rustDeriveTrait Escape
hi! def link rustCharacter String
hi! def link rustCommentLineDoc Comment
hi! def link rustSelf Normal

"----------------------
" VimL
"----------------------
hi! def link vimLet Normal
hi! def link vimFunction Definition
hi! def link vimCommand Definition

"----------------------
" FZF
"----------------------
hi! def link fzf1 StatusLine
hi! def link fzf2 StatusLine
hi! def link fzf3 StatusLine

"----------------------
" ALE
"----------------------
hi! def link ALEWarningSign Warning
hi! def link ALEWarning Warning
hi! def link ALEErrorSign Error
hi! def link ALEError Error

"----------------------
" Terminal
"----------------------
let g:terminal_color_0  = s:alabaster_colors.black.gui
let g:terminal_color_1  = s:alabaster_colors.red.gui
let g:terminal_color_2  = s:alabaster_colors.green.gui
let g:terminal_color_3  = s:alabaster_colors.yellow.gui
let g:terminal_color_4  = s:alabaster_colors.blue.gui
let g:terminal_color_5  = s:alabaster_colors.magenta.gui
let g:terminal_color_6  = s:alabaster_colors.cyan.gui
let g:terminal_color_7  = s:alabaster_colors.white.gui
let g:terminal_color_8  = s:alabaster_colors.bright_black.gui
let g:terminal_color_9  = s:alabaster_colors.bright_red.gui
let g:terminal_color_10 = s:alabaster_colors.bright_green.gui
let g:terminal_color_11 = s:alabaster_colors.bright_yellow.gui
let g:terminal_color_12 = s:alabaster_colors.bright_blue.gui
let g:terminal_color_13 = s:alabaster_colors.bright_magenta.gui
let g:terminal_color_14 = s:alabaster_colors.bright_cyan.gui
let g:terminal_color_15 = s:alabaster_colors.bright_white.gui

"----------------------
" Git
"----------------------
hi! def link diffAdded String
hi! def link diffRemoved Comment
hi! def link DiffAdd diffAdded
hi! def link DiffDelete diffRemoved
