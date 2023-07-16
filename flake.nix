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

  outputs = inputs@{ self, nixpkgs, home-manager, darwin, nix-config-private }: {
    darwinConfigurations."Miless-Mac-mini" = darwin.lib.darwinSystem {
      modules = [ ./machines-flake/Miless-Mac-mini/default.nix ];
    };
  };
}
