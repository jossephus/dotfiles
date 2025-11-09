"nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
"vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

"function! GrepOperator(type, ...)
	"if a:type ==# 'v'
		"execute "normal! `<v`>y"
	"elseif a:type ==# 'char'
		"execute "normal! `[v`]y"
	"else
		"return
	"endif
	"silent execute "grep -R " . shellescape(@@) . " ."
	"copen
"endfunction

" hello world
"vnoremap <leader>e :execute "normal! `<ih<esc>"

" :help operatorfunc example {{{ 
"function! CountSpaces(type, ...)
"let sel_save = &selection
"let &selection = "inclusive"
"let reg_save = @@

"if a:0 " Invoked from Visual mode, use gv command
"silent exe "normal! gvy"
"elseif a:type == 'line'
"silent exe "normal! '[V']y"
"else
"silent exe "normal! `[v`]y"
"endif
"echon "hello"
"echomsg strlen(substitute(@@, '[^ ]', '', 'g'))

"let &selection = sel_save
"let @@ = reg_save
"endfunction
" }}}
