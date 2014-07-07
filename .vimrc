" Vundle stuff...
	set nocompatible
  syntax on
	filetype on
  filetype indent on
  filetype plugin on

	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	Plugin 'gmarik/Vundle.vim'
  Plugin 'moll/vim-node'
  Plugin 'tpope/vim-rails'
	Plugin 'scrooloose/nerdtree'
	Plugin 'Lokaltog/vim-easymotion'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'digitaltoad/vim-jade'
  Plugin 'wavded/vim-stylus'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-scripts/EasyGrep'

	call vundle#end()

" Easymotion stuff...
	" Allows you to avoid repeated hjkl keystrokes
	map <Leader>h <Plug>(easymotion-linebackward)
	map <Leader>j <Plug>(easymotion-j)
	map <Leader>k <Plug>(easymotion-k)
	map <Leader>l <Plug>(easymotion-lineforward)

	" Uncomment to allow for keeping the cursor in the column its in when jk
	" navigating
	" let g:EasyMotion_startofline = 0

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
  set backspace=indent,eol,start

  set background=dark
	colorscheme solarized
