
" https://github.com/faisalfjri/tailwind-dark-theme
" generated by https://nice.github.io/themeforge/ 
"
" ==========> Reset
set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'make-apps'

" ==========> Highlight function
function! s:h(face, guibg, guifg, ctermbg, ctermfg, gui)
  let l:cmd="highlight " . a:face
  
  if a:guibg != ""
    let l:cmd = l:cmd . " guibg=" . a:guibg
  endif

  if a:guifg != ""
    let l:cmd = l:cmd . " guifg=" . a:guifg
  endif

  if a:ctermbg != ""
    let l:cmd = l:cmd . " ctermbg=" . a:ctermbg
  endif

  if a:ctermfg != ""
    let l:cmd = l:cmd . " ctermfg=" . a:ctermfg
  endif

  if a:gui != ""
    let l:cmd = l:cmd . " gui=" . a:gui
  endif

  exec l:cmd
endfun


" ==========> Colors dictionary

" GUI colors dictionary (hex)
let s:hex = {}
" Terminal colors dictionary (256)
let s:bit = {}

let s:hex.color0="#242e33"
let s:hex.color1="#c5c8c6"
let s:hex.color2="#8abeb7"
let s:hex.color3="#515b60"
let s:hex.color4="#2e383d"
let s:hex.color5="#566065"
let s:hex.color6="#384247"
let s:hex.color7="#6a7479"
let s:hex.color8="#30383c"
let s:hex.color9="#495155"
let s:hex.color10="#6f797e"
let s:hex.color11="#6d8eaa"
let s:hex.color12="#424c51"
let s:hex.color13="#e3e6e4"
let s:hex.color14="#cfd2d0"
let s:hex.color15="#475156"
let s:hex.color16="#6c7a80"
let s:hex.color17="#de935f"
let s:hex.color18="#81a2be"
let s:hex.color19="#b294bb"
let s:hex.color20="#b5bd68"

let s:bit.color5="59"
let s:bit.color9="67"
let s:bit.color2="109"
let s:bit.color13="139"
let s:bit.color14="143"
let s:bit.color12="173"
let s:bit.color0="236"
let s:bit.color4="237"
let s:bit.color6="238"
let s:bit.color8="239"
let s:bit.color3="240"
let s:bit.color7="243"
let s:bit.color1="251"
let s:bit.color11="252"
let s:bit.color10="254"


" ==========> General highlights 
call s:h("Normal", s:hex.color0, s:hex.color1, s:bit.color0, s:bit.color1, "none")
call s:h("Cursor", s:hex.color2, "", s:bit.color2, "", "none")
call s:h("Visual", s:hex.color3, "", s:bit.color3, "", "none")
call s:h("ColorColumn", s:hex.color4, "", s:bit.color4, "", "none")
call s:h("LineNr", "", s:hex.color5, "", s:bit.color5, "none")
call s:h("CursorLine", s:hex.color6, "", s:bit.color6, "", "none")
call s:h("CursorLineNr", "", s:hex.color7, "", s:bit.color7, "none")
call s:h("CursorColumn", s:hex.color6, "", s:bit.color6, "", "none")
call s:h("StatusLineNC", s:hex.color8, "", s:bit.color4, "", "none")
call s:h("StatusLine", s:hex.color9, "", s:bit.color8, "", "none")
call s:h("VertSplit", "", s:hex.color10, "", s:bit.color7, "none")
call s:h("Folded", s:hex.color6, s:hex.color11, s:bit.color6, s:bit.color9, "none")
call s:h("Pmenu", s:hex.color12, s:hex.color13, s:bit.color8, s:bit.color10, "none")
call s:h("PmenuSel", s:hex.color4, s:hex.color14, s:bit.color4, s:bit.color11, "none")
call s:h("EndOfBuffer", s:hex.color0, s:hex.color15, s:bit.color0, s:bit.color8, "none")
call s:h("NonText", s:hex.color0, s:hex.color15, s:bit.color0, s:bit.color8, "none")


" ==========> Syntax highlights
call s:h("Comment", "", s:hex.color16, "", s:bit.color7, "none")
call s:h("Constant", "", s:hex.color17, "", s:bit.color12, "none")
call s:h("Special", "", s:hex.color17, "", s:bit.color12, "none")
call s:h("Function", "", s:hex.color18, "", s:bit.color2, "none")
call s:h("Statement", "", s:hex.color19, "", s:bit.color13, "none")
call s:h("Operator", "", s:hex.color2, "", s:bit.color2, "none")
call s:h("PreProc", "", s:hex.color19, "", s:bit.color13, "none")
call s:h("Type", "", s:hex.color19, "", s:bit.color13, "none")
call s:h("String", "", s:hex.color20, "", s:bit.color14, "none")
call s:h("Number", "", s:hex.color17, "", s:bit.color12, "none")

highlight link cStatement Statement
highlight link cSpecial Special


" Generated using https://github.com/nice/themeforge
" Feel free to remove the above URL and this line.

