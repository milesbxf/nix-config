{
  nixpkgs,
  nix-config-private,
  alejandra,
  system,
  nixvim-config,
  home-manager,
  ...
}: let
  userinfo = nix-config-private.user;
  username = userinfo.username;
in {
  # import custom packages
  nixpkgs.overlays = [(import ../../pkgs)] ++ (import ../../overlays);

  inherit userinfo;
  imports = [
    ../../programs/packages.nix
    ../../programs/git.nix
    ../../programs/kitty.nix
    ../../programs/shell.nix
    ../../programs/tmux.nix
  ];

  home = {
    stateVersion = "21.05";
    sessionVariables = {
      EDITOR = "code --wait";
      VISUAL = "code --wait";

      BAT_THEME = "Monokai Extended Light";
      GOPATH = "/Users/${username}";
    };

    packages = [
      alejandra.defaultPackage.${system}
      nixvim-config.packages.${system}.default
    ];
  };
}
