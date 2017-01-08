" File ~/.vim/ftplugin/all.vim

highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="81,".join(range(101,999),",")

set listchars=trail:·,precedes:«,extends:»,tab:▸\ 
set list

" Removes trailing spaces
autocmd BufWritePre * %s/\s\+$//e

setlocal expandtab
