{ config, pkgs, profile, userinfo, ...}:
{
  imports = [
    <home-manager/nix-darwin>
    ../nix/userinfo.nix
  ];

  users.knownUsers = [userinfo.username];
  users.users.${userinfo.username} = {
    uid = userinfo.uid;
    name = userinfo.username;
  };

  home-manager.users.${userinfo.username} = { pkgs, ...}:{
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
  };

}
