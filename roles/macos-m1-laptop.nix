{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.package = pkgs.nix;
  services.nix-daemon.enable = true;

  nix.nixPath =
    [ "darwin=$HOME/.nix-defexpr/darwin"
      "darwin-config=$HOME/.nixpkgs/darwin-configuration.nix"
    ];

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;
  programs.nix-index.enable = true;
}
