"========= Plugins =========

call plug#begin('~/.local/share/nvim/plugged')

"Sensible vim defaults
Plug 'tpope/vim-sensible'

" Async job control
Plug 'prabirshrestha/async.vim'

"========= UI =========

"Status/tabline
Plug 'vim-airline/vim-airline'

"Displays tags of the current file (classes, functions etc.)
Plug 'majutsushi/tagbar'

"Allows traversing undo history as a tree
Plug 'mbbill/undotree'

"Allows switching between vim and other tmux panes
Plug 'christoomey/vim-tmux-navigator'

"Shows indent guides
Plug 'Yggdroot/indentLine'

"Tree explorer
Plug 'scrooloose/nerdtree'

"Pretty ()
Plug 'junegunn/rainbow_parentheses.vim'

" Highlight yank
Plug 'machakann/vim-highlightedyank'

Plug 'ncm2/float-preview.nvim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'


Plug 'vimwiki/vimwiki'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'mattn/calendar-vim'


"========= Editing/motions =========

"Automatically closes HTML/XML tags
Plug 'docunext/closetag.vim'

"Motion plugin - jump to a location based on two characters
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

"Allows sorting via `gs` motion
Plug 'christoomey/vim-sort-motion'

"Comments out blocks of vim text objs using `gc`
Plug 'tpope/vim-commentary'

"Allows alignment of several lines around vim text objs
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


"========= Snippets =========

" Use <TAB> for all insert completion

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cwood/ultisnips-terraform-snippets'


"========= File utilities (linting, autocompletion) =========

"Autocompletion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"Asychronous Lint Engine, on the fly linting of files
" Plug 'w0rp/ale'

"Formats a file using formatter defined for its filetype
Plug 'sbdchd/neoformat'

"Fuzzy searching of files using FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release' }

"Better diffing
Plug 'chrisbra/vim-diff-enhanced'


"========= Languages =========

Plug 'avakhov/vim-yaml'
Plug 'hashivim/vim-terraform'
Plug 'andrewstuart/vim-kubernetes'
Plug 'fatih/vim-go', {  'tag': 'v1.22', 'do': ':GoUpdateBinaries' }

Plug 'Shougo/neco-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


Plug 'wellle/tmux-complete.vim'

Plug 'rodjek/vim-puppet'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

Plug 'google/vim-jsonnet'

" TEST govim
" Plug 'file:///Users/milesbryant/src/github.com/myitcv/govim'

"Makes vim indentation PEP8 compatible
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'zchee/deoplete-jedi'

Plug 'heavenshell/vim-pydocstring'


call plug#end()


