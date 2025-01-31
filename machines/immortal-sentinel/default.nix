{
  nixpkgs,
  pkgs,
  nix-config-private,
  ...
}: let
  userinfo = nix-config-private.user;
  username = userinfo.username;
in {
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.useDaemon = true;

  networking = {
    dns = ["1.1.1.1"];
    # for MacOS, use networksetup -listallhardwareports
    knownNetworkServices = ["USB 10/100/1000 LAN" "Ethernet Adapter (en4)" "Ethernet Adapter (en5)" "Wi-Fi" "Bluetooth PAN" "Thunderbolt 1" "Thunderbolt 2"];
  };

  environment.systemPackages = [pkgs.git];

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;
  programs.nix-index.enable = true;

  nixpkgs.config.allowUnfree = true;

  users.users.${username} = {
    uid = userinfo.uid;
    name = username;
    home = /Users/${username};
    shell = /Users/${username}/.nix-profile/bin/zsh;
  };

  programs.zsh.enable = true;

  system.stateVersion = 5;
}
