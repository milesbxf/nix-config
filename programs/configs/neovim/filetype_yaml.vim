
autocmd BufWritePre *.yaml :%s/\s\+$//e  "remove trailing whitespace
" two space tabs for YAML
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
