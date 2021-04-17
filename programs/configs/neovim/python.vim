" =============================== Python files ===============================

autocmd BufWritePre *.py :%s/\s\+$//e  "remove trailing whitespace
" Python settings
au FileType python set autoindent
au FileType python set smartindent
au FileType python set tabstop=4 shiftwidth=4 expandtab
au FileType python set textwidth=79  " PEP-8

let g:neoformat_enabled_python = ['black', 'isort']
