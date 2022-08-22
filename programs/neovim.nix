{ pkgs, ...}:
let userlib = import ../userlib {}; in 
{
  home.packages = with pkgs; [
    python3Packages.pynvim
  ];

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    extraConfig = ''
      " Gruvbox theme config; see https://github.com/morhetz/gruvbox/wiki/Configuration
      let g:gruvbox_italic         = 1
      let g:gruvbox_bold           = 1
      let g:gruvbox_underline      = 1
      let g:gruvbox_undercurl      = 1
      let g:gruvbox_contrast_light = 'medium'
      let g:airline_theme          = 'gruvbox'

      colorscheme gruvbox
      set background=dark
    '' + (userlib.concatFiles (userlib.lsFiles ./configs/neovim));

    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      vim-nix
      vim-nixhash
    ];
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.zsh.shellAliases = {
    v = "nvim";
    vw = "nvim -c VimwikiIndex";
  };

  home.file.".ideavimrc".text = ''
    """ Map leader to space ---------------------
    let mapleader=" "

    """ Plugins  --------------------------------
    Plug '<extension-github-reference>'
    Plug 'https://github.com/easymotion/vim-easymotion'
    Plug 'vim-easymotion'
    set easymotion

    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'machakann/vim-highlightedyank'
    Plug 'dbakker/vim-paragraph-motion'
    Plug 'michaeljsmith/vim-indent-object'

    set surround
    set multiple-cursors
    set commentary
    set argtextobj
    set textobj-entire
    set ideajoin
    set ReplaceWithRegister

    """ Plugin settings -------------------------
    let g:argtextobj_pairs="[:],(:),<:>"

    """ Common settings -------------------------
    set showmode
    set so=5
    set incsearch
    set hlsearch
    set nu
    set relativenumber

    """ Idea specific settings ------------------
    set ideajoin
    set ideastatusicon=gray
    set idearefactormode=keep

    " Show a few lines of context around the cursor. Note that this makes the
    " text scroll if you mouse-click near the start or end of the window.
    set scrolloff=5

    " Do incremental .
    set incsearch

    " Don't use Ex mode, use Q for formatting.
    map Q gq

    map <leader>r <Action>(Rerun)
    map <leader>t <Action>(ActivateTerminalToolWindow)
    map <leader>= <Action>(SplitVertically)
    map <leader>- <Action>(SplitHorizontally)
    map <leader>s <Action>(SearchEverywhere)
    map <leader>o <Action>(GotoClass)
    map <leader>f <Action>(GotoFile)
    map <leader>d <Action>(GotoSymbol)
    map <leader>g <Action>(GotoGit)

    map <C-J> <C-W>j
    map <C-K> <C-W>k
    map <C-L> <C-W>l
    map <C-H> <C-W>h
  '';
}

