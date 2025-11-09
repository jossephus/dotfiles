" :help vimrc-intro
"---------------------------index------------------------------------"
"Init
"Visuals
"Search
"SplitManagement
"Folds
"Mappings
"Plugins
"Macros
"Commands
"AutoCommands
"Miscelleanous




"-------------------------------Init-------------------------------------"
syntax enable

let mapleader = ","

"so $HOME/.vim/pack/before-installing/start/FakeVundle.vim/test/.vimrc
so $HOME/.vim/plugins.vim		" 
"so $HOME/.vim/play.vim			" experimental vimrc uncomment when playing



set number
set autowriteall 		" Automatically write the file
"set ignorecase			" BAD! Ignore Case When Searching
"set complete=.,w,b,u 		" 
set showcmd





"---------------------------------Visuals-----------------------------"
colorscheme Tomorrow-Night

"set t_Co=256
hi vertsplit guifg=bg guibg=bg





"-------------------------Miscelleanous-------------------------------"
set tabstop=4
set shiftwidth=4	" 4 steps at a time instead of 8
set softtabstop=4
set expandtab

set colorcolumn=80

" useful but at the sametime not relevant
set undofile
set undodir=~/.vim/.undodir






"--------------------------------Search-------------------------------"
set hlsearch
set incsearch
nmap <silent> <Leader><space> :nohlsearch<cr>
nmap <C-S> <nop>
nmap <C-Esc> :echo "Hello World"





"-------------------------------SplitManagement----------------------"
set splitbelow
set splitright
nmap <C-W> <C-W><C-W>





"-------------------------------Folds----------------------"
"set foldopen=all		" automatically open fold on cursor
"set foldclose=all		" automatically close fold when moving
set foldmethod=marker





"-----------------------------Mappings--------------------------------"

" source vimrc
"inoremap <UP>  	<nop>
"inoremap <LEFT> 	<nop>
"inoremap <DOWN> 	<nop>
"inoremap <RIGHT> 	<nop>

noremap <Leader>sv :so $MYVIMRC<cr>

nmap <Leader>ev :vsplit  $MYVIMRC<cr>		
nmap <Leader>nv :vsplit ~/.nvim_config/nvim/init.lua<cr>
nmap <Leader>eV :tabedit $HOME/.vim<cr>
nmap <Leader>ep :tabedit $HOME/.vim/plugins.vim<cr>
nmap <Leader>eb :tabedit $HOME/.bashrc<cr>
nmap <Leader>et :tabedit $HOME/.todos.md<cr>
nmap <Leader>ec :tabedit $HOME/.check.md<cr>
nmap <Leader>es :tabedit ~/.vim/snippets/


" default tab operations are way too long 
nmap <Leader>te :tabedit<space>
nmap tp :tabprevious<cr>
nmap tn :tabnext<cr>

" help us in setting filetype of a file
nnoremap <Leader>ft :set ft=
"nnoremap <Leader>fte :execute "set ft=" . expand("%:e")<cr>
nnoremap <Leader>ff :execute "set ft=" . expand("%:e")<cr>


"imap <Leader><Leader> <C-N>
imap <Leader><tab> <C-N>

" echo out the syntax item under cursor
"		from help :synID
nnoremap <Leader>sd :echo synIDattr(synID(line("."), col("."), 1), "name")<cr>
inoremap <C-S> :echo "Hello World"

" take me back to where i was before but less painful
noremap <Leader>b <C-^>



"--------------------------Commands--------------------------------"
inoremap <C-s> <esc>:w<CR>



"--------------------------AutoCommands-----------------------------"
" automatically source vimrc after saving
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

augroup autochangecolorschemes
	autocmd!
	autocmd BufWritePost colors/*.vim execute "colorscheme " . expand("%:p:t:r")
augroup END


" IF_YOU_EVER_MISS_SUBLIME_TEXT_AUTO_LOAD_YOUR_LAST_WORKING_DIR " {{{
"augroup save_when_leaving_load_when_entering
    "autocmd!
    "autocmd StdinReadPre * let s:std_in = 1
    "autocmd VimEnter * if argc() == 0 | exe "LoadLatestSession" | endif
    "autocmd QuitPre  * :MakeSession
"augroup END " 
" }}}


"automatically format golang files 
"augroup fmt_go
"autocmd!
"autocmd BufLeave *.go :!gofmt -w %
"augroup END





"---------------------------Macros------------------------------------"
" opens the terminal on the right-hand side of the window
let @t=":vsp:term␗␗␗:q␗␗"

" for css remove classes from tag
" <div class="abc"></div> 	=> 	<div class="">div>
let @c="/classwf\"lci\"␛€ýall"







"---------------------------Plugins-----------------------------------"
"/
"/
"/ languageclient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ }

    "\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    "\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    "\ 'python': ['/usr/local/bin/pyls'],
    "\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],

" note that if you are using Plug mapping you should not use `noremap` mappings.
"nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <Leader>vrr <Plug>(lcn-rename)

"/
"/ SnipMate
"/
"let g:snipMate = { 'snippet_version' : 1 }
"let g:snipMate = get(g:, 'snipMate', 'snippet_version': 1})
let g:snipMate = get(g:, 'snipMate', {'snippet_version': 1})


"/
"/ seoul2 colorscheme
"/

"let g:seoul256_background = 233



"/
"/ nerdcommenter
"/
let g:NERDCustomDelimiters = { 
	    \ 'lox': { 'left': '//' },
	    \ 'dart': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
	    \ }


"/
"/ nerdtree
"/
let g:NERDTreeHijackNetrw = 0

"/
"/ vim-php-namespace
"/
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


"/
"/ rainbow
"/
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'dart': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\           'guibgs': ['green'],
\	        'cterms': ['italic'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody',
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
\		},
\		'css': 0,
\	}
\}

"/
"/ auto-pairs
"/
"
"

"/
"/ vim-geez
"/
function! ToggleGeezKeyboard() 
   if &keymap !=# "geez"
       set keymap=geez
   else
       set keymap=
   endif
endfunction

nnoremap <Leader>g :call ToggleGeezKeyboard()<cr>
inoremap <Leader>g <ESC>:call ToggleGeezKeyboard()<cr>i

"--------------------------for-the-love-of-it------------------------"
"augroup auto_indent_html
"autocmd!
"autocmd BufWritePre *.html :normal gg=G				"gg=G
"augroup END

"augroup comment_python
"autocmd!
"autocmd FileType python inoremap <Leader>ff <esc>0i#<esc>ji
"augroup END





"---------------------------hacks------------------------------------"
"za	 				unfold
"zc 					
">G					
";					
",					
"& 					
":123,234 s/regexp/change		
