" Vundle stuff...
	set nocompatible
	filetype off

	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	Plugin 'gmarik/Vundle.vim'
  Plugin 'moll/vim-node'
  Plugin 'tpope/vim-rails'
	Plugin 'scrooloose/nerdtree'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'digitaltoad/vim-jade'
  Plugin 'wavded/vim-stylus'
  Plugin 'godlygeek/tabular'
  Plugin 'terryma/vim-multiple-cursors'

	call vundle#end()
	filetype plugin indent on

" NERDTree stuff...
	" Auto open NERDTree
	autocmd vimenter * NERDTree

	" Auto open NERDTree in directory if no files specified
	autocmd vimenter * if !argc() | NERDTree | endif
	
	" Map CTRL-N to toggle NERDTree
	map <C-n> :NERDTreeToggle<CR>

	" Auto close if last window open is NERDTree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" My stuff...
	set shiftwidth=2
	set tabstop=2
	set expandtab
	set ignorecase
	set smartcase
	set ruler
	set nu

	syntax enable
	" Stuff for Solarized colorscheme
	" colorscheme solarized
