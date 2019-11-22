" sdothum - 2016 (c) wtfpl

" Colorscheme
" ══════════════════════════════════════════════════════════════════════════════

" Duochrome ____________________________________________________________________

" ................................................................... Initialize
if ! exists('g:colors_name') | let g:colors_name = '' | endif
if g:colors_name != 'duochrome'
  hi! clear  " will cause flickering on subsequent 'set background' refreshes if not suppressed
  if exists('syntax on') | syntax reset | endif
  let g:colors_name = 'duochrome'
endif

" ui colorscheme controls providing dynamic 'set background' changes
if ! exists('g:duochrome_cursorline') | let g:duochrome_cursorline = 0 | endif  " cursorline (0) dfm (1) highlight
if ! exists('g:duochrome_insert')     | let g:duochrome_insert     = 0 | endif  " mode (0) normal (1) insert
if ! exists('g:duochrome_markdown')   | let g:duochrome_markdown   = 0 | endif  " source (0) code (1) markdown
if ! exists('g:duochrome_relative')   | let g:duochrome_relative   = 0 | endif  " linenr (0) norelative (1) relative
if ! exists('g:duochrome_ruler')      | let g:duochrome_ruler      = 0 | endif  " column (0) off (1) cursor (2) fixed
if ! exists('g:duochrome_split')      | let g:duochrome_split      = 0 | endif  " windows (0) single (1) split
if ! has('gui_running')               | let g:duochrome_cursorline = 1 | endif

" ...................................................................... Palette
" colours borrowed from vim-quantum/material design, vim-one and flatwhite-vim colorschemes
if ! exists('s:duochrome')
  let s:duochrome       = 1
  " gray tones
  let s:BLACK           = { "gui": "black",   "cterm": "0"   }
  if empty($DISPLAY)
    let s:black         = s:BLACK  " hide numbers and fold column in console
  else
    let s:black         = { "gui": "#263238", "cterm": "235" }  " material design
  endif
  let s:subtle_black    = { "gui": "#37474f", "cterm": "237" }  " ..
  let s:light_black     = { "gui": "#455a64", "cterm": "239" }  " ..
  let s:lighter_black   = { "gui": "#546e7a", "cterm": "241" }  " ..
  let s:medium_gray     = { "gui": "#607d8b", "cterm": "243" }  " ..
  let s:light_gray      = { "gui": "#78909c", "cterm": "245" }  " ..
  let s:lighter_gray    = { "gui": "#90a4ae", "cterm": "247" }  " ..
  let s:darker_white    = { "gui": "#b0bec5", "cterm": "249" }  " ..
  let s:dark_white      = { "gui": "#cfd8dc", "cterm": "251" }  " .. tint
  let s:subtle_white    = { "gui": "#e9e0d7", "cterm": "253" }  " .. tone
  let s:white           = { "gui": "#f7f3ee", "cterm": "255" }  " flatwhite
  let s:WHITE           = { "gui": "white",   "cterm": "15"  }
  " text colours
  let s:dark_red        = { "gui": "#e45649", "cterm": "1"   }  " one
  let s:light_red       = { "gui": "#dd7186", "cterm": "211" }  " quantum
  let s:dark_blue       = { "gui": "#4078f2", "cterm": "12"  }  " one
  let s:light_blue      = { "gui": "#70ace5", "cterm": "4"   }  " quantum
  let s:dark_green      = { "gui": "#50a14f", "cterm": "34"  }  " one
  let s:light_green     = { "gui": "#87bb7c", "cterm": "71"  }  " quantum
  let s:dark_cyan       = { "gui": "#0184bc", "cterm": "31"  }  " one
  let s:light_cyan      = { "gui": "#69c5ce", "cterm": "14"  }  " quantum
  let s:dark_purple     = { "gui": "#a626a4", "cterm": "92"  }  " one
  let s:light_purple    = { "gui": "#a48add", "cterm": "105" }  " quantum
  let s:dark_yellow     = { "gui": "#c18401", "cterm": "136" }  " one
  let s:light_yellow    = { "gui": "#d5b875", "cterm": "11"  }  " quantum
  " bg colours
  let s:blue_bg         = { "gui": "#dde4f2", "cterm": "153" }  " flatwhite
  let s:orange_bg       = { "gui": "#f7e0c3", "cterm": "223" }  " flatwhite
  let s:iawriter        = { "gui": "#20fccf", "cterm": "51"  }  " ia writer cursor
endif

" ................................................................... Background
if ! exists('s:background') | let s:background = '' | endif

function! s:b(light, dark)
  return &background == "light" ? a:light : a:dark
endfunction

if s:background != &background
  let s:background       = &background
  let s:bg               = s:b(s:white,         s:black)
  let s:bg_reverse       = s:b(s:BLACK,         s:white)
  let s:bg_subtle        = s:b(s:lighter_gray,  s:light_black)
  let s:bg_contrast      = s:b(s:light_gray,    s:darker_white)
  let s:norm             = s:b(s:light_black,   s:dark_white)
  let s:norm_subtle      = s:b(s:lighter_black, s:darker_white)
  let s:norm_very_subtle = s:b(s:lighter_gray,  s:medium_gray)
  let s:red              = s:b(s:dark_red,      s:light_red)
  let s:blue             = s:b(s:dark_blue,     s:light_blue)
  let s:green            = s:b(s:dark_green,    s:light_green)
  let s:cyan             = s:b(s:dark_cyan,     s:light_cyan)
  let s:purple           = s:b(s:dark_purple,   s:light_purple)
  let s:yellow           = s:b(s:dark_yellow,   s:light_yellow)
  let s:cursor_line      = s:b(s:subtle_white,  s:subtle_black)
  let s:statement        = s:b(s:subtle_black,  s:subtle_white)
  let s:constant         = s:b(s:dark_cyan,     s:light_cyan)
  let s:comment          = s:b(s:dark_yellow,   s:dark_green)
  let s:selection        = s:b(s:light_yellow,  s:dark_yellow)
  let s:selection_fg     = s:b(s:white,         s:black)
  let s:visual           = s:b(s:light_blue,    s:lighter_black)
  let s:guide            = s:b(s:blue_bg,       s:dark_blue)
  let s:column           = s:b(s:orange_bg,     s:light_black)
  let s:gutter           = s:b(s:light_blue,    s:dark_blue)
  let s:statusline       = s:b(s:subtle_white,  s:subtle_black)
  let s:spell            = s:b(s:orange_bg,     s:subtle_black)
  let s:warning          = s:b(s:light_yellow,  s:light_yellow)
  let s:fzf              = s:b(s:black["gui"],  s:white["gui"])
endif

" ................................................................ Set highlight
" see https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" .................................................................. Cursor/line
" cursor
call s:h("Cursor",                { "fg": s:black, "bg": s:iawriter })  " ia writer cursor
if empty($DISPLAY)
  call s:h("CursorLine",          { "cterm": "underline" })             " console
else
  if &diff
    call s:h("CursorLine",        { "gui": "underline" })
  else
    if g:duochrome_insert && g:duochrome_markdown
      call s:h("CursorLine",      { "fg": s:bg_reverse, "bg": g:duochrome_cursorline ? s:cursor_line : s:bg })
    else
      call s:h("CursorLine",      { "bg": g:duochrome_cursorline ? s:cursor_line : s:bg })
    endif
  endif
endif
call s:h("Ignore",                { "fg": s:bg })
hi! link CommandCursor            Cursor
hi! link InsertCursor             Cursor
hi! link ReplaceCursor            Cursor
hi! link VisualCursor             Cursor

" linenr
if g:duochrome_relative
  call s:h("CursorLineNr",        { "fg": s:bg })
  call s:h("LineNr",              { "fg": s:blue })
else
  call s:h("CursorLineNr",        { "fg": g:duochrome_insert ? s:bg : s:blue })
  call s:h("LineNr",              { "fg": s:bg })
endif

" marks
hi! link FoldColumn               Ignore
call s:h("SignColumn",            { "bg": s:bg })
hi! link ShowMarksHLl             SignColumn

" ...................................................................... Special
" normal
call s:h("Normal",                { "fg": s:norm, "bg": s:bg })
call s:h("ExtraWhitespace",       { "fg": s:bg_reverse, "bg": s:iawriter })

" keywords
hi! link Identifier               Normal
hi! link Function                 Identifier
hi! link Type                     Normal
hi! link StorageClass             Type
hi! link Structure                Type
hi! link Typedef                  Type
hi! link Special                  Normal
hi! link SpecialChar              Special
hi! link Tag                      Special
hi! link Delimiter                Special
hi! link SpecialComment           Special
hi! link Debug                    Special
hi! link PreProc                  Normal
hi! link Define                   PreProc
hi! link Macro                    PreProc
hi! link Precondit                comment  " highlight code sections

" operator
call s:h("Noise",                 { "fg": s:norm_subtle, "gui": "none" })
hi! link Operator                 Noise

" ................................................................. Text objects
" comment
call s:h("comment",               { "fg": s:comment, "gui": "italic" })

" constant
call s:h("Constant",              { "fg": s:constant })
hi! link Character                Constant
hi! link Number                   Constant
hi! link Boolean                  Constant
hi! link Float                    Constant
hi! link String                   Constant
hi! link Directory                Constant
hi! link Title                    Constant

" statement
call s:h("statement",             { "fg": s:statement, "gui": "bold" })
hi! link Include                  Statement
hi! link Conditonal               Statement
hi! link Repeat                   Statement
hi! link Label                    Statement
hi! link Keyword                  Statement
hi! link Exception                Statement

" ...................................................................... Message
" errormsg
call s:h("ErrorMsg",              { "fg": s:red })
hi! link Error                    ErrorMsg
hi! link Question                 ErrorMsg
" warningmsg
call s:h("WarningMsg",            { "fg": s:yellow })
" moremsg
call s:h("moremsg",               { "fg": s:norm_subtle, "cterm": "bold", "gui": "bold" })
hi! link ModeMsg                  MoreMsg

" .................................................................... Highlight
" search
call s:h("Search",                { "bg": s:red, "fg": s:selection_fg })
call s:h("incsearch",             { "bg": s:iawriter, "fg": s:BLACK })

" visual
call s:h("Visual",                { "bg": s:visual })
" visualnos
call s:h("VisualNOS",             { "bg": s:bg_subtle })

" diff
if &diff
  call s:h("DiffAdd",               { "bg": s:statusline, "fg": s:green })
  call s:h("DiffDelete",            { "bg": s:statusline, "fg": s:red })
  call s:h("DiffChange",            { "bg": s:statusline, "fg": s:yellow })
  call s:h("DiffText",              { "bg": s:statusline, "fg": s:constant })
else
  call s:h("DiffAdd",               { "fg": s:green })
  call s:h("DiffDelete",            { "fg": s:red })
  call s:h("DiffChange",            { "fg": s:yellow })
  call s:h("DiffText",              { "fg": s:constant })
endif
hi! link diffRemoved              DiffDelete
hi! link diffAdded                DiffAdd

" spelling
call s:h("SpellBad",              { "bg": s:spell })
hi! link SpellCap                 SpellBad
hi! link SpellLocal               SpellBad
hi! link SpellRare                SpellBad

" hypertext
hi! link helpHyperTextEntry       Title
hi! link helpHyperTextJump        String

" ................................................................... Statusline
" statusline
call s:h("StatusLine",            { "bg": s:statusline, "fg": s:norm_subtle })
call s:h("User1",                 { "fg": s:norm_subtle, "bg": g:duochrome_split ? s:statusline : s:bg })
call s:h("User2",                 { "fg": s:norm_very_subtle, "bg": g:duochrome_split ? s:statusline : s:bg })
call s:h("User3",                 { "fg": s:red, "bg": g:duochrome_split ? s:statusline : s:bg })
" statuslinenc
call s:h("StatusLineNC",          { "bg": g:duochrome_split ? s:statusline : s:bg })
" statusline status
call s:h("StatusLineOk",          { "gui": "underline", "bg": s:bg, "fg": s:green })
call s:h("StatusLineError",       { "gui": "underline", "bg": s:bg, "fg": s:red })
call s:h("StatusLineWarning",     { "gui": "underline", "bg": s:bg, "fg": s:yellow })

" ...................................................................... Nontext
" division
call s:h("Folded",                { "fg": s:bg, "bg": s:bg_contrast })
call s:h("VertSplit",             { "fg": s:statusline, "bg": s:statusline })

" guide
call s:h("IndentGuidesOdd",       { "bg": s:bg })
call s:h("IndentGuidesEven",      { "bg": s:guide })
call s:h("ColorColumn",           { "bg": g:duochrome_ruler == 1 ? s:column : s:guide })

" nontext
call s:h("NonText",               { "fg": s:red })

" ......................................................................... Menu
" pmenu
call s:h("Pmenu",                 { "fg": s:norm, "bg": s:cursor_line })
hi! link PmenuSbar                Pmenu
hi! link PmenuThumb               Pmenu
" pmenusel
call s:h("pmenusel",              { "fg": s:norm, "bg": s:cursor_line, "gui": "bold" })
" wildmenu
call s:h("WildMenu",              { "gui": "underline,bold", "bg": s:bg, "fg": s:norm })

" tabline
hi! link TabLine                  Normal
hi! link TabLineSel               Keyword
hi! link TabLineFill              Normal

" matchparen
call s:h("MatchParen",            { "bg": s:red, "fg": s:white })

" ..................................................................... Filetype
" html
hi! link htmlH1                   statement  " markdown heading content
hi! link htmlH2                   Statement
hi! link htmlH3                   Statement
hi! link htmlH4                   Statement
hi! link htmlH5                   Statement
hi! link htmlH6                   Statement

" markdown
hi! link mkdHeading               Statement
hi! link mkdLink                  htmlString
hi! link markdownH1               Statement
hi! link markdownH2               Statement
hi! link markdownH3               Statement
hi! link markdownH4               Statement
hi! link markdownH5               Statement
hi! link markdownH6               Statement
hi! link markdownListMarker       Constant
hi! link markdownCode             Constant
hi! link markdownCodeBlock        Constant
hi! link markdownCodeDelimiter    Constant
hi! link markdownHeadingDelimiter Constant

" javascript
hi! link jsFlowTypeKeyword        Statement
hi! link jsFlowImportType         Statement
hi! link jsFunction               Statement
hi! link jsGlobalObjects          Normal
hi! link jsGlobalNodeObjects      Normal
hi! link jsArrowFunction          Noise
hi! link StorageClass             Statement

" xml
hi! link xmlTag                   Constant
hi! link xmlTagName               xmlTag
hi! link xmlEndTag                xmlTag
hi! link xmlAttrib                xmlTag

" python
hi! link pythonOperator           Statement
hi! link yamlBlockMappingKey      Statement

" ....................................................................... Gutter
" ale
call s:h("ALEErrorSign",          { "fg": s:red })
call s:h("ALEWarningSign",        { "fg": s:warning })

" signify
call s:h("SignifyLineAdd",        { "fg": s:gutter })
hi! link SignifyLineAdd           SignifyLineAdd
hi! link SignifyLineChange        SignifyLineAdd
hi! link SignifyLineDelete        SignifyLineAdd
hi! link SignifySignAdd           SignifyLineAdd
hi! link SignifySignDelete        SignifyLineAdd
hi! link SignifySignChange        SignifyLineAdd

" git-gutter
hi! link GitGutterAdd             SignifyLineAdd
hi! link GitGutterDelete          SignifyLineAdd
hi! link GitGutterChange          SignifyLineAdd
hi! link GitGutterChangeDelete    SignifyLineAdd

" ....................................................................... Plugin
" sneak
hi! link SneakScope               Cursor

" fzf
let $FZF_DEFAULT_OPTS = '--reverse --color=fg+:' . s:fzf  " cannot appear to set other colors, such as hl+ (?)
" hide bottom fzf window identifier
call s:h("fzf1",                  { "fg": s:bg })
call s:h("fzf2",                  { "fg": s:bg })
call s:h("fzf3",                  { "fg": s:bg })

" .......................................................................... EOF
" hide tilde
call s:h("EndOfBuffer",           { "fg": s:bg, "ctermfg": s:black })
hi! link Pmenu                    Statusline  " reset menu highlight after loading autocompletion plugin
hi! link PmenuSel                 Cursor
hi! link Wildmenu                 Cursor      " match command line tab menu

" duochrome.vim