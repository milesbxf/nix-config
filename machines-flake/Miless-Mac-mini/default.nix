{ config, nixpkgs, nix-config-private, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.useDaemon = true;


  networking = {
    dns = ["1.1.1.1"];
    # for MacOS, use networksetup -listallhardwareports
    knownNetworkServices = ["USB 10/100/1000 LAN" "Ethernet Adapter (en4)" "Ethernet Adapter (en5)" "Wi-Fi" "Bluetooth PAN" "Thunderbolt 1" "Thunderbolt 2"];
  };

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;
  programs.nix-index.enable = true;

  nixpkgs.config.allowUnfree = true;

  users.users.${nix-config-private.username} = {
    # uid = nix-config-private.uid;
    # name = nix-config-private.username;
    # home = /Users/${nix-config-private.username};
    # shell = /Users/${nix-config-private.username}/.nix-profile/bin/zsh;
  };
}

