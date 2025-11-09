
function! s:escaped(first, last)
    return getline('.')
endfunction

"nnoremap <buffer> . :<C-U> <C-R>=<SID>escaped(line('.'), line('.') - 1 + v:count1)<CR><HOME><CR>
nnoremap <buffer> . :<C-U>silent echo <SID>escaped(line('.'), line('.'))<cr>
