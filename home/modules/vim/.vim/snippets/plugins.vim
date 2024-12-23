"UNTIL THEN {{{
"
function! LocalPlugin(name, reponame=a:name)
	let new_path = $HOME . '/.vim/bundle/' . a:name
	let bundle_before =
				\ $HOME . "/Documents/workspace/miscellaneous/tools/vim/src/bundle.before/"
	let read_link = system('readlink ' . new_path)

	if read_link ==# "" 
		silent execute "silent !ln -s " . bundle_before . a:name . " " . new_path
	endif
	Plugin a:reponame . '/' . a:name
	return a:reponame . '/' . a:name 
endfunction
command! -nargs=* FromBundleBefore :call LocalPlugin(<f-args>)
"---------------}}}
"
set nocompatible              " be iMproved, required

filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()



Plugin 'VundleVim/Vundle.vim'		" let Vundle manage Vundle, required
Plugin 'tpope/vim-vinegar'
Plugin 'lluchs/vim-wren'
Plugin 'preservim/nerdcommenter'
Plugin 'mattn/emmet-vim'
"Plugin 'ervandew/supertab'

" vim-snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

Plugin 'dstein64/vim-startuptime'

Plugin 'junegunn/seoul256.vim'
Plugin 'cespare/vim-toml'
Plugin 'leafOfTree/vim-vue-plugin'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/webapi-vim'
Plugin 'luochen1990/rainbow'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" { lang: JS }
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'

" {lang: Dart}
Plugin 'dart-lang/dart-vim-plugin'
" Plugin 'neoclide/coc.nvim'

" {lang: kdl} -- because zellij uses KDL
Plugin 'imsnif/kdl.vim'

Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'autozimu/LanguageClient-neovim'
"Plugin 'nerdtree'
"Plugin 'vim-nerdtree-tabs'
"Plugin 'undotree'
"Plugin 'conflict-marker.vim'
"Plugin 'vim-tailwindcss' 'vim-tailwindcss'
"Plugin 'webapi-vim' 
"Plugin 'vim-php-namespace'
"Plugin 'auto-pairs'
"Plugin 'rainbow'
"Plugin 'webapi-vim'
"Plugin 'gist-vim'
"Plugin 'rust.vim' 'rust-vim'
"Plugin 'vim-surround'

" My Local Plugins
Plugin 'file:///home/aldrich/.vim/bundle/vim-clox'
Plugin 'file:///home/aldrich/.vim/bundle/my-colorschemes'
Plugin 'file:///home/aldirch/.vim/bundle/vim-geez'
Plugin 'file:///home/aldrich/.vim/bundle/MakeSession'
"Plugin 'file:///home/aldrich/.vim/bundle/dart-until-then'
"{{{ 
" FromBundleBefore
"FromBundleBefore 'ctrlp.vim' 'ctrlp'
" FromBundleBefore 'nerdtree'
"FromBundleBefore 'vim-nerdtree-tabs'
"FromBundleBefore 'undotree'
"FromBundleBefore 'conflict-marker.vim' 'conflict-marker'
"FromBundleBefore 'vim-tailwindcss' 'vim-tailwindcss'
"FromBundleBefore 'webapi-vim' 
"FromBundleBefore 'vim-php-namespace'
"FromBundleBefore 'auto-pairs'
"FromBundleBefore 'rainbow'
"FromBundleBefore 'webapi-vim'
"FromBundleBefore 'gist-vim'
"FromBundleBefore 'rust.vim' 'rust-vim'
"FromBundleBefore 'vim-surround'
"}}}

call vundle#end()            " required

filetype plugin indent on    " required

