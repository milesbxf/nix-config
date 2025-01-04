{
  nixpkgs,
  nix-config-private,
  system,
  pkgs,
  ...
}: let
  system = "aarch64-darwin";
  userinfo = nix-config-private.user;
  username = userinfo.username;
in {
  nixpkgs.hostPlatform = system;
  nix.useDaemon = true;

  networking = {
    dns = ["1.1.1.1"];
    # for MacOS, use networksetup -listallhardwareports
    knownNetworkServices = ["USB 10/100/1000 LAN" "Wi-Fi" "Thunderbolt 1" "Thunderbolt 2"];
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
