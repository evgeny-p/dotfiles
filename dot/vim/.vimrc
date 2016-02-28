" File ~/.vimrc

" vundle

set nocompatible              " be iMproved
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

Plugin 'chase/vim-ansible-yaml'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jiangmiao/auto-pairs'

call vundle#end() " required
"

let g:ycm_confirm_extra_conf = 0

filetype plugin indent on
syntax on

set ts=4
set sw=4
set autoindent

set backspace=2 " default backspace behaviour
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" For some reason home and end keys are not mapping properly.
" Home key
imap <esc>OH <esc>0i
cmap <esc>OH <home>
nmap <esc>OH 0
" End key
nmap <esc>OF $
imap <esc>OF <esc>$a
cmap <esc>OF <end>

" interface

" fix term bgcolor
set t_ut=
set nowrap
let g:rehash256=1
colorscheme monokai

" When 'wildmenu' is on, command-line completion operates in an enhanced
" mode. On pressing 'wildchar' (usually <Tab>) to invoke completion,
" the possible matches are shown just above the command line, with the
" first match highlighted (overwriting the status line, if there is
" one).
set wildmenu 
set wildignore+=.hg,.git,.svn " Version control

" always show statusline
set laststatus=2
let g:Powerline_symbols = 'fancy'

" show line numbers
set number
" window title
" the title of the window will be set to the value of 'titlestring'
" (if it is not empty), or to: filename [+=-] (path) - VIM
set title

" focus mode like in Writer app http://www.iawriter.com/
set scrolloff=999

" show current line
set cursorline
set splitbelow " новый сплит будет ниже текущего :sp
set splitright " новый сплит будет правее текущего :vsp

" Search
set incsearch " При поиске перескакивать на найденный текст в процессе набора строки
set hlsearch " Включаем подсветку выражения, которое ищется в тексте
set ignorecase " Игнорировать регистр букв при поиске
set smartcase " Override the 'ignorecase' if the search pattern contains upper case characters
set gdefault " Включает флаг g в командах замены, типа :%s/a/b/
