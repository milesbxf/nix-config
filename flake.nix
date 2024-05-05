{
  description = "My personal machines setup";

  inputs = { 
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-config-private.url = "git+ssh://git@github.com/milesbxf/nix-config-private";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin, nix-config-private }: 
  let 
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
    home-manager = home-manager.darwinModules.home-manager;

    username = nix-config-private.user.username;
    commonArgs = { inherit nix-config-private nixpkgs pkgs home-manager; };
    importWithArgs = path: import path commonArgs;
  in
  {
    darwinConfigurations."immortal-sentinel" = darwin.lib.darwinSystem {
      modules = [ ({...}: importWithArgs ./machines/immortal-sentinel/default.nix) ];
    };

    homeConfigurations = (importWithArgs ./home/${username}/home.nix);
  };
}
