set termguicolors  " Ensure we're running in 256 true colour mode


" Gruvbox theme config; see https://github.com/morhetz/gruvbox/wiki/Configuration
let g:gruvbox_italic         = 1
let g:gruvbox_bold           = 1
let g:gruvbox_underline      = 1
let g:gruvbox_undercurl      = 1
let g:gruvbox_contrast_light = 'medium'
let g:airline_theme          = 'gruvbox'

colorscheme gruvbox
set background=light

" Git gutter symbols
let g:signify_vcs_list=['git']
let g:signify_realtime = 1
let g:signify_line_highlight = 0
highlight link SignifySignAdd             DiffAdd
highlight link SignifySignChange          DiffChange
highlight link SignifySignDelete          DiffDelete
highlight link SignifySignChangeDelete    SignifySignChange
highlight link SignifySignDeleteFirstLine SignifySignDelete

set inccommand=split

set showmode   "display current mode in statusbar
set showcmd    "display current command input in statusbar

set wildmenu   "autocompletion in vim command mode
set wildmode=longest:full,full

set wrap linebreak nolist
set textwidth=0  "wrapping width"

set visualbell  "Flash screen instead of beeping when I do something wrong
set ruler       "Display current line,column & relative position at bottom

" Mouse integration!
if has('mouse')
  set mouse=a
endif


"========================== UI: indent guides =============================
let g:indentLine_setColors = 0
let g:indentLine_color_term = 167
let g:indentLine_char = ''


"====================== UI: Line numbers/highlighting =========================
" Set "hybrid" line number mode - display the current line number, but relative
" line numbers for all other lines. See https://jeffkreeftmeijer.com/vim-number/
:set relativenumber
:set number

" Set width of number column & use for wrapped text 
:set numberwidth=3
:set cpoptions+=n

" Highlight current line
:set cursorline

" keep current line/cursor centred on screen
set scrolloff=999


set showmatch  "Display matching brace

" Display whitespace characters
set list
set showbreak=↪
set listchars=tab:‐›,nbsp:.,eol:¬,trail:•,extends:»,precedes:«

set infercase   "ignore case in autocomplete
let &colorcolumn=join(range(80,999),",") "visual margin for line width

