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
    nixpkgs.overlays = [ (import ../pkgs) ];

    inherit userinfo;
    imports = [
      ../programs/cli-utilities.nix
      ../programs/dev-tools.nix
      ../programs/neovim.nix
      ../programs/gimp.nix
      ../programs/git.nix
      ../programs/kitty.nix
      ../programs/kubernetes.nix
      ../programs/shell.nix
      ../programs/tmux.nix
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

}
