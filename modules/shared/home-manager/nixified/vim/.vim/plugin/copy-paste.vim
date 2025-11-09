function! CopyLine() range	
	let lines = getline(a:firstline, a:lastline)
	vsplit ~/.vim_copy_paste
	normal! ggdG
	call append(0, lines)
	write
	quit
endfunction

function! PasteLine()
	read ~/.vim_copy_paste
endfunction
