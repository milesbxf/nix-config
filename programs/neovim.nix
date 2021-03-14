{ pkgs, ...}:
let userlib = import ../userlib {}; in 
{
  home.packages = with pkgs; [
    pythonPackages.pynvim
    python27Packages.pynvim
  ];

  programs.neovim.enable = true;
  programs.neovim.withNodeJs = true;

  programs.neovim.extraConfig = (userlib.concatFiles (userlib.lsFiles ./configs/neovim));
}

