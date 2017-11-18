" No rice, no life
set encoding=utf8
set t_Co=16
syntax on
set background=dark
set laststatus=2
set noshowmode

" Plugins
execute pathogen#infect()
colorscheme nord
let g:netrw_dirhistmax=0
let g:airline_theme='nord'
let g:airline_powerline_fonts=0
let g:airline_symbols_ascii=1
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''

" Highlights
augroup Highlights
	autocmd!
	autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME\|XXX', -1)
augroup END

" Invisible characters
set number!
set nocursorline
set list!
nmap <C-i> :set list!<CR>
set showbreak=>\
set showtabline=0

" 4 hard spaces identation
set shiftwidth=4
set tabstop=4

" Use mouse and primary clipboard
set mouse=a
vmap <C-c> "+y
nmap <C-c> "+yy
vmap <C-v> "+p
nmap <C-v> "+p
imap <C-v> <Esc>"+p

" Set path to current directory recursively
set path=$PWD/**

" Disable .viminfo file
set viminfo=
