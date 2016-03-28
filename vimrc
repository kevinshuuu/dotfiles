set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Functionality
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'thoughtbot/vim-rspec'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'lilydjwg/colorizer'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-endwise'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

" Syntax
Plugin 'slim-template/vim-slim.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leshill/vim-json'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'


call vundle#end()
filetype plugin indent on
syntax on

" NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Ctags/TagBar
nmap <C-b> :TagbarToggle<CR>

" Vim readability
set nu
set hlsearch
set nowrap

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Clipboard stuff
set clipboard=unnamed

" Airline displayed by default
set laststatus=2

" Making GitGutter look better
highlight clear SignColumn
let g:gitgutter_sign_column_always = 1

" 80 character column marker
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="100"

function! AirlineInit()
  let g:airline_section_b = airline#section#create(['%{strftime("%A, %b %d | %I:%M %p")}'])
  let g:airline_section_c = airline#section#create(['hunks','%F'])
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
endfunction
autocmd VimEnter * call AirlineInit()

" vim-rspec
let mapleader = ","
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"
