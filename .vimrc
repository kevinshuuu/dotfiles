set nocompatible
filetype on
syntax on
filetype indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Functionality
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-endwise'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

" Syntax
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leshill/vim-json'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'


call vundle#end()
filetype plugin indent on

" NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Vim readability
set nu
set hlsearch

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Airline displayed by default
set laststatus=2

" Making GitGutter look better
highlight clear SignColumn
let g:gitgutter_sign_column_always = 1

" 80 character column marker
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80"

function! AirlineInit()
  let g:airline_section_b = airline#section#create(['%{strftime("%A, %b %d | %I:%M %p")}'])
  let g:airline_section_c = airline#section#create(['hunks','%t'])
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
endfunction
autocmd VimEnter * call AirlineInit()

