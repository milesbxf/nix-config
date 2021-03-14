{ ... }:
import ./base.nix {
  pkgs = import <nixpkgs> {};

  hostname = "radon-circus";
  networkInterfaces = ["USB 10/100/1000 LAN" "Wi-Fi" "Bluetooth PAN" "Thunderbolt Bridge"];
}
