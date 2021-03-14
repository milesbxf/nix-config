{ pkgs, ...}:
{
  home.packages = with pkgs; [
      pkgs.kubectl
      pkgs.kubectx
      pkgs.kubernetes-helm
  ];
}
