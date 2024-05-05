{
  description = "My personal machines setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-config-private.url = "git+ssh://git@github.com/milesbxf/nix-config-private";

    flake-utils.url = "github:numtide/flake-utils";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    darwin,
    nix-config-private,
    flake-utils,
    alejandra,
    ...
  }: let
    username = nix-config-private.user.username;
    importWithArgs = {
      path,
      system,
    }: let
      pkgs = nixpkgs.legacyPackages.${system};
    in (import path {inherit nix-config-private nixpkgs pkgs home-manager alejandra system;});
  in {
    darwinConfigurations = {
      "immortal-sentinel" = darwin.lib.darwinSystem {
        modules = [
          ({...}:
            importWithArgs {
              path = ./machines/immortal-sentinel/default.nix;
              system = "aarch64-darwin";
            })
          home-manager.darwinModules.home-manager
          {
            home-manager.users.${username} = importWithArgs {
              path = ./home/${username};
              system = "aarch64-darwin";
            };
          }
        ];
      };

      "Miless-MacBook-Pro-2" = darwin.lib.darwinSystem {
        modules = [
          ({...}:
            importWithArgs {
              path = ./machines/Miless-MacBook-Pro-2/default.nix;
              system = "x86_64-darwin";
            })
          home-manager.darwinModules.home-manager
          {
            home-manager.users.${username} = importWithArgs {
              path = ./home/${username};
              system = "x86_64-darwin";
            };
          }
        ];
      };
    };

    devShell = flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      "${system}".default = pkgs.mkShell {
        packages = [pkgs.bashInteractive];
      };
    });
  };
}
