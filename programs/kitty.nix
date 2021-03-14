{ config, pkgs, ...}:
{
  home.packages = [ pkgs.kitty ];

  home.file.".config/kitty/kitty.conf".text = builtins.readFile ./configs/kitty/kitty.conf;
}
