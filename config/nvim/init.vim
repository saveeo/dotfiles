" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vim/vimrc

" 
" ToDo in configuration 
"
" - ftplugin for nvim (python,lua and C)
" - define leader key 
" - setup quickfix
" - setup rpath
" - 
"

" disable strict vi compatibility
set nocompatible
filetype off

" 
" Plugin section source
"
source ~/.config/nvim/plugins.vim

"
" key mapping 
"
source ~/.config/nvim/keymapping.vim

" 
" theme configuration
"
set termguicolors
source ~/.config/nvim/themes.vim

" 
" vim config options
" 

" change default search to be on staroid
set ignorecase 
set smartcase
set incsearch

" set syntax highlighting
syntax on

" set relativenumber 
set rnu

" set encoding
set encoding=utf-8

" Setting up global options for tabs
" This options will be overwritten by ftplugin in ~/.vim/ftplugin/$lang.vim
set tabstop=4
set shiftwidth=2
set noexpandtab

" setting binary options for binary files
" assuming binary files has extenstion *.bin
au BufNewFile,BufRead *.bin
	\ set bin

" disable showmode as statusline shows mode now
set noshowmode
