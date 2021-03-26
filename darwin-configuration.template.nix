{ config, pkgs, ... }:
let
  profile = ./users/profiles/home.nix;
  includes = [
    ./machines/<MACHINE_NAME>.nix
    ./roles/macos-t1-laptop.nix
    ./users/milesbryant.nix
  ];
in
(import ./base.nix { inherit config pkgs includes profile; })
