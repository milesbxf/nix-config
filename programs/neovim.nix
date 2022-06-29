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

    plugins = with pkgs.vimPlugins; [ gruvbox-nvim ];
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.zsh.shellAliases = {
    v = "nvim";
    vw = "nvim -c VimwikiIndex";
  };
}

