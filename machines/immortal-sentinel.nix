{ ... }:
import ./base.nix {
  pkgs = import <nixpkgs> {};

  hostname = "immortal-sentinel";

  # for MacOS, use networksetup -listallhardwareports
  networkInterfaces = ["Ethernet Adapter (en4)" "Ethernet Adapter (en5)" "Ethernet Adapter (en6)" "Wi-Fi" "Thunderbolt 1" "Thunderbolt 2" "Thunderbolt 3" "Thunderbolt Bridge"];
}
