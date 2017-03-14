" Color list
let s:colors = [
\ "#31353c", "#b44b4b", "#5c9e5c", "#ce955b",
\ "#3879b7", "#905ddb", "#1cbfbf", "#737680",
\ "#505059", "#fe93be", "#b0ea77", "#dbdb70",
\ "#95acda", "#d47fd4", "#7ec4a0", "#989ca7",
\ "#e1e1e1", "#1d1f21", "#e1e1e1"
\ ]

func! <sid>H(group, fg, bg, attr)
    let fg = (a:fg is "" || a:fg > 15) ? "NONE" : a:fg
    let bg = (a:bg is "" || a:bg > 15) ? "NONE" : a:bg
    let guifg = (a:fg is "") ? "NONE" : s:colors[a:fg]
    let guibg = (a:bg is "") ? "NONE" : s:colors[a:bg]
    let attr = (a:attr is "") ? "NONE" : a:attr

    exec "hi ".a:group
        \ . " guifg=".guifg . " ctermfg=".fg
        \ . " guibg=".guibg . " ctermbg=".bg
        \ . " gui=".attr . " cterm=".attr
endfunc
func! <sid>L(group, dst_group)
    exec "hi link ".a:group." ".a:dst_group
endfunc

set background=dark
hi clear
syntax reset

let g:colors_name = "horizon"

call <sid>H("Normal", "16", "17", "")
call <sid>H("Cursor", "18", "", "reverse")


" Specific Text {{{
call <sid>H("ModeMsg", 8, "", "")
call <sid>H("NonText", 8, "", "")
call <sid>H("SpecialKey", 8, "", "")

call <sid>H("MoreMsg", 7, "", "")
call <sid>H("Question", 1, "", "")
call <sid>H("WarningMsg", 3, "", "")
call <sid>H("ErrorMsg", 1, 0, "")
"}}}


" UI Syntax {{{
call <sid>H("Title", 15, "", "")
call <sid>H("Directory", 13, "", "")

call <sid>H("LineNr", 7, "", "")
call <sid>H("VertSplit", 8, "", "")
call <sid>H("StatusLine", 0, 7, "")
call <sid>H("StatusLineNC", 0, 0, "")
call <sid>H("Folded", 3, "", "")
call <sid>H("FoldColumn", 3, "", "")

call <sid>H("Visual", 7, "", "reverse")
call <sid>H("IncSearch", 10, 2, "")
call <sid>H("Search", 0, 2, "")

call <sid>H("WildMenu", "", "", "reverse")

call <sid>H("TabLine", 0, 7, "")
call <sid>H("TabLineFill", 0, 8, "")
call <sid>H("MatchParen", "", 13, "")

if version >= 700
    call <sid>H("CursorLine", "", 8, "")
    call <sid>H("CursorColumn", "", 8, "")

    call <sid>H("PMenu", 0, 5, "")
    call <sid>H("PMenuSel", 0, 5, "reverse")
    call <sid>H("SignColumn", 8, "", "")
end
if version >= 703
    call <sid>H("ColorColumn", "", 8, "")
end
"}}}


" Diff {{{
call <sid>H("DiffAdd", "", 2, "")
call <sid>H("DiffChange", "", 3, "")
call <sid>H("DiffDelete", "", 1, "")
call <sid>H("DiffText", 5, "", "")

" Git COMMIT_EDITMSG
call <sid>H("diffAdded", 2, "", "")
call <sid>H("diffRemoved", 1, "", "")
" }}}


" Code Groups {{{
call <sid>H("Comment", 7, "", "")

call <sid>H("Constant", 3, "", "")
call <sid>H("Number", 11, "", "")
call <sid>H("Boolean", 6, "", "")

call <sid>H("Statement", 4, "", "")

call <sid>H("Type", 4, "", "")

call <sid>H("Identifier", 6, "", "")

call <sid>H("PreProc", 6, "", "")

call <sid>H("Special", 6, "", "")

"hi Underlined
call <sid>H("Ignore", 7, "", "")

call <sid>H("Error", "", 1, "")
call <sid>H("Todo", 0, 11, "")
" }}}

delfunc <sid>H
delfunc <sid>L

