{
  description = "My personal machines setup";

  inputs = { 
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";

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
  in
  {
    darwinConfigurations."immortal-sentinel" = darwin.lib.darwinSystem {
      modules = [ ({...}: import ./machines-flake/immortal-sentinel/default.nix { inherit nix-config-private nixpkgs pkgs home-manager; }) ];
    };

    homeConfigurations = (import ./machines-flake/home.nix { inherit nix-config-private nixpkgs pkgs home-manager; });
  };
}
