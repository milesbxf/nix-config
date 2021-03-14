# milesbxf Nix configuration

Collection of Nix configs for different machines.



## How this works

### Darwin machines

Define a darwin-configuration:
```
{ config, pkgs, ... }:
let
  profile = ./users/profiles/home.nix;
  includes = [
    ./machines/radon-circus.nix
    ./roles/macos-t1-laptop.nix
    ./users/milesbryant.nix
  ];
in
(import ./base.nix { inherit config pkgs includes profile; })
```

`profile` links to a set that matches the `./nix/userinfo.nix` interface with information about a user.

`includes` are modules to be imported to build the system configuration.

This includes all home-manager config.
