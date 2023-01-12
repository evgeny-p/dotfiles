call plug#begin()
Plug 'chun-yang/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" UI
set cursorline
set number

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault

" Indentation
" See https://vim.fandom.com/wiki/Indenting_source_code
filetype plugin indent on

set tabstop=4
set shiftwidth=4

" Remove trailing spaces
" See https://vim.fandom.com/wiki/Remove_unwanted_spaces
autocmd FileType c autocmd BufWritePre * %s/\s\+$//e

set termguicolors
colorscheme base16-cupertino
