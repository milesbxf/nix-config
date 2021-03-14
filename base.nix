# base is a generic wrapper that imports different modules, passing config into all of them
{ config, pkgs, includes, profile, ... }:
let
  userinfo = import profile;
in
{
  imports = 
    (map (i: import i {inherit config pkgs includes profile userinfo;}) includes)
    ++
    [
      ./nix/userinfo.nix
    ];
}
