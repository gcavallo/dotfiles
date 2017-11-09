" No rice, no life
set encoding=utf8
set t_Co=256
let base16colorspace=256
syntax on
set background=dark
colorscheme base16-ocean
let g:airline_theme='base16_shell'

augroup HighlightTODO
	autocmd!
	autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME\|XXX', -1)
augroup END

" Invisible characters
set number!
set nocursorline
set list!
nmap <C-I> :set list!<CR>
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
