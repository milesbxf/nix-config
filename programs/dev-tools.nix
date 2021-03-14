{ pkgs, ...}:
{
  home.packages = with pkgs; [
    cfssl
    go
    httpie
    hugo
    python27
    python38
    qrencode
    vagrant
  ];
}
