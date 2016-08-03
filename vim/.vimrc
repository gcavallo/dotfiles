" No rice, no life
set encoding=utf8
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
syntax on
set background=dark
colorscheme base16-ocean
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

augroup HiglightTODO
	autocmd!
	autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME\|XXX', -1)
augroup END

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
vmap <C-C> "+y

" Set path to current directory recursively
set path=$PWD/**

" Disable .viminfo file
set viminfo=
