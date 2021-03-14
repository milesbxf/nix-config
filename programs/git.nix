{ config, pkgs, ...}:
{

  imports = [
    ../nix/userinfo.nix
  ];

  home.packages = [ pkgs.git-hub ];

  programs.git = {
    enable = true;
    userName = config.userinfo.username;
    userEmail = config.userinfo.email;

    delta.enable = true;

    signing = if config.userinfo.gpgKeyName != "" then {
      key = config.userinfo.gpgKeyName;
      signByDefault = true;
    } else {};

    extraConfig = let userlib = import ../userlib {}; in (userlib.concatFiles (userlib.lsFiles ./configs/git));
  };
}
