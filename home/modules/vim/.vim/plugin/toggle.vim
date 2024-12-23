"nnoremap <leader>f :call <SID>foldColumnToggle()<cr>

"function! s:foldColumnToggle()
	"if &foldcolumn
		"setlocal foldcolumn=0
	"else
		"setlocal foldcolumn=4
	"endif
"endfunction

"nnoremap <leader>q :call <SID>quickFixToggle()<cr>

"let g:quick_fix_is_open = 0

"function! s:quickFixToggle()
	"if g:quick_fix_is_open
		"cclose
		"let g:quick_fix_is_open = 0	
		"execute g:quickfix_return_to_window . "wincmd w"
	"else
		"let g:quickfix_return_to_window = winnr()
		"copen
		"let g:quick_fix_is_open = 1
	"endif
"endfunction
