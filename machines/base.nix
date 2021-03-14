{ hostname, pkgs, networkInterfaces, ... }:
{
  # machine = {
  #   hostname = hostname;
  #   work = work;
  # };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  environment.systemPackages =
    [ pkgs.git
  ];


  networking.knownNetworkServices = networkInterfaces;
  networking.dns = ["1.1.1.1"];

}
