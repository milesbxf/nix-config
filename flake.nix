{
  description = "My personal machines setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-config-private.url = "git+ssh://git@github.com/milesbxf/nix-config-private";

    flake-utils.url = "github:numtide/flake-utils";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";

    nixvim-config = {
      url = "git+ssh://git@github.com/milesbxf/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    darwin,
    nix-config-private,
    flake-utils,
    alejandra,
    nixvim-config,
    ...
  }: let
    username = nix-config-private.user.username;
    importWithArgs = {
      path,
      system,
    }: let
      pkgs = nixpkgs.legacyPackages.${system};
    in (import path {inherit nix-config-private nixpkgs pkgs home-manager alejandra nixvim-config system;});
  in
    {
      darwinConfigurations = {
        "Miless-Mac-mini" = darwin.lib.darwinSystem {
          modules = [
            ({...}:
              importWithArgs {
                path = ./machines/Miless-Mac-mini/default.nix;
                system = "x86_64-darwin";
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
        "immortal-sentinel" = darwin.lib.darwinSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./machines/immortal-sentinel/configuration.nix
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
    }
    // flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in rec {
      devShells.default = pkgs.mkShell {
        buildInputs = [pkgs.bashInteractive];
      };
    });
}
