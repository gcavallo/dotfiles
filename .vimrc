" No rice, no life
set encoding=utf8
set t_Co=16
syntax on
set background=dark
hi NonText ctermfg=DarkGray
hi SpecialKey ctermfg=DarkGray
hi LineNr ctermfg=DarkGray

" Invisible characters
set number!
set nocursorline
set list!
set showbreak=>\
set showtabline=0

" 4 hard spaces identation
set shiftwidth=4
set tabstop=4

" Use mouse and primary clipboard
set mouse=a
set clipboard=unnamedplus
:vmap <C-C> "+y

" Set path to current directory recursively
set path=$PWD/**

" Disable .viminfo file
set viminfo=
