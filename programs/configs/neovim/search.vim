" ================================= Searching =================================
"Activate "very magic" mode when searching, similar to regex stuff. See `:help \v
nnoremap / /\v
vnoremap / /\v

"When searching, ignore case if the search string is all lowercase, but make it
"case sensitive if there is an uppercase character
set smartcase
set ignorecase


"Uses ripgrep to recursively search files under the current directory
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)



