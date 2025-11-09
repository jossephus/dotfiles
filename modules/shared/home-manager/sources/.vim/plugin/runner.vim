" taken from vim-clox
" made it to work for others too
"

function! ProgramRunner(progname)
    let progname = a:progname
    let resultWindowName = '__RUNNER_WIN__'

    let result = system(progname . " " . bufname("%"))

    if bufloaded(resultWindowName)
	while bufname('%') !=# resultWindowName
	    execute "wincmd w"
	endwhile
    else
	execute ":vsplit " . resultWindowName 
    endif

    setlocal modifiable
    normal! ggdG
    setlocal buftype=nofile
    setlocal noswapfile

    call append(0, split(result, '\v\n'))
    setlocal nomodifiable
    normal! gg

    " let's go back to our previous window
    execute "wincmd p"
endfunction

let map_ft_to_progname = {
	    \ 'dart': 'dart',
	    \ 'wren': 'wren',
	    \ 'php': 'php',
        \ 'lua': 'luajit',
	    \ }

function! s:init_runner(filetype)
    execute ":nnoremap <script> <buffer> <CR><CR> :call ProgramRunner('" . 
		\ g:map_ft_to_progname[&ft] . "')<CR>"
endfunction

autocmd! BufEnter * if index(keys(map_ft_to_progname),  &ft) != -1 | 
	    \ :call s:init_runner(&ft) | 
	    \ endif 
