"========================== Key mapping ============================


" leader key
let mapleader = "\<Space>"

" Hit jj in insert mode to trigger ESC
inoremap jj <ESC>

" Make backspace behaviour sane
set backspace=eol,start,indent

"in Visual mode, hitting . applies the same action to all lines
vnoremap . :norm.<CR>

"Make TAB work in normal & visual modes
nnoremap <tab> %
vnoremap <tab> %

"Leader key shortcuts

"show open buffers
noremap <leader>b :FzfPreviewBuffers<cr>

noremap <C-e> :let @c="<C-r><C-r>c"
noremap <leader>e :!zsh -c 'tmux send-keys -t {right-of} C-c C-c "<C-r><C-r>c" Enter'<cr><cr>

"search in files with ripgrep
noremap <leader>s :Find<cr>
"search filenames with FZF

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>
nnoremap <silent> [fzf-p]d     :<C-u>FzfPreviewDirectoryFiles<CR>

"Search file history
noremap <leader>hf :History<cr>
"Search command history
noremap <leader>hc :History:<cr>
"Search search history
noremap <leader>hs :History/<cr>

noremap <leader>1 :SignifyToggleHighlight<cr>

"Search windows
noremap <leader>i :Windows<cr>

"Search snippets
noremap <leader>n :Snippets<cr>

"Search nvim commands
noremap <leader>; :Commands<cr>

"Search commits
noremap <leader>ca :Commits<cr>
noremap <leader>cb :BCommits<cr>

" Yank & put from clipboard register
noremap <leader>y "+y
noremap <leader>p "+p

"generate tags for tagtree
noremap <leader>gt :! generate-tags<cr>
"Splits, vertical & horizontal
noremap <leader>= :vsp<cr><C-W>l<cr>
noremap <leader>- :sp<cr><C-W>j<cr>
"write & quit
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>x :x<cr>
noremap <leader>z :xall<cr>

"open undotree/tagbar
noremap <leader>u :UndotreeToggle<cr>
noremap <leader>] :TagbarToggle<cr>
noremap <leader>t :NERDTreeToggle<cr>

autocmd FileType markdown noremap <leader>gp <Plug>MarkdownPreviewToggle<cr>

"Go commands

autocmd FileType go noremap gt :GoTest<cr>
autocmd FileType go noremap gft :GoTestFunc<cr>

autocmd FileType go noremap gb :<C-u>call <SID>build_go_files()<cr>
autocmd FileType go noremap gv :GoDoc<cr>
autocmd FileType go noremap <leader>g :GoDeclsDir<cr>

nnoremap <C-.> :cnext<cr>
nnoremap <C-,> :cprevious<cr>
nnoremap <C-/> :cclose<cr>

"remove search highlighting
nnoremap <leader><space> :noh<cr>

"move between vim panes with Ctrl-J etc.
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C--> <Plug>(pydocstring)


let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


noremap <leader>r :Neoformat<cr>
