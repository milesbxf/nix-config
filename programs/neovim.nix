{ pkgs, ...}:
let userlib = import ../userlib {}; in 
{
  home.packages = with pkgs; [
    pythonPackages.pynvim
    python27Packages.pynvim
  ];

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    extraConfig = (userlib.concatFiles (userlib.lsFiles ./configs/neovim));
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.zsh.shellAliases = {
    v = "nvim";
    vw = "nvim -c VimwikiIndex";
  };
}

