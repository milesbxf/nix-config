{ ... }:
import ./base.nix {
  pkgs = import <nixpkgs> {};

  hostname = "selenium-paradigm";

  # for MacOS, use networksetup -listallhardwareports
  networkInterfaces = ["USB 10/100/1000 LAN" "Wi-Fi" "Bluetooth PAN" "Thunderbolt Bridge"];
}
