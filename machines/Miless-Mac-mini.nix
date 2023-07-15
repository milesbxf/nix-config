{ ... }:
import ./base.nix {
  pkgs = import <nixpkgs> {};

  hostname = "Miless-Mac-mini";

  # for MacOS, use networksetup -listallhardwareports
  networkInterfaces = ["USB 10/100/1000 LAN" "Ethernet Adapter (en4)" "Ethernet Adapter (en5)" "Wi-Fi" "Bluetooth PAN" "Thunderbolt 1" "Thunderbolt 2"];
}
