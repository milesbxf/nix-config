{ pkgs, ...}:
{
  home.packages = with pkgs; [
    cfssl
    httpie
    hugo
    python27
    python38
    qrencode
    vagrant
  ];

  programs.gh.enable = true;
  programs.go.enable = true;
}
