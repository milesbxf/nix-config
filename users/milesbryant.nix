{ config, pkgs, profile, userinfo, ...}:
{
  imports = [
    <home-manager/nix-darwin>
    ../nix/userinfo.nix
  ];

  users.users.${userinfo.username} = {
    uid = userinfo.uid;
    name = userinfo.username;
    home = /Users + ("/" + userinfo.username);
    shell = /Users + ("/" + userinfo.username) + /.nix-profile/bin/zsh;
  };

  # needs to be enabled both here and in home-manager
  programs.zsh.enable = true;

  home-manager.users.${userinfo.username} = { pkgs, ...}:{

    # import custom packages
    nixpkgs.overlays = [ (import ../pkgs) ] ++ (import ../overlays);

    inherit userinfo;
    imports = [
      ../programs/packages.nix
      ../programs/neovim.nix
      ../programs/git.nix
      ../programs/kitty.nix
      ../programs/shell.nix
      ../programs/tmux.nix
    ];

    home = {
      stateVersion = "21.05";
      sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";

        BAT_THEME = "Monokai Extended Light";
      };
    };
  };

}
