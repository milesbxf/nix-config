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
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin, nix-config-private, flake-utils, ... }: 
  let 
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};

    username = nix-config-private.user.username;
    commonArgs = { inherit nix-config-private nixpkgs pkgs home-manager; };
    importWithArgs = path: import path commonArgs;
  in
  {
    darwinConfigurations."immortal-sentinel" = darwin.lib.darwinSystem {
      modules = [
        ({...}: importWithArgs ./machines/immortal-sentinel/default.nix) 
        home-manager.darwinModules.home-manager {
          home-manager.users.${username} = importWithArgs ./home/${username};
        }
      ];
    };

    devShells.aarch64-darwin.default = pkgs.mkShell {
      packages = [ pkgs.bashInteractive ];
    };
  };
}
