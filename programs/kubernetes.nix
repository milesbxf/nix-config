{ pkgs, ...}:
{
  home.packages = with pkgs; [
      pkgs.kubectl
      pkgs.kubectx
      pkgs.kubernetes-helm
  ];


  programs.zsh.shellAliases = {
    kube-nodeports = "kubectl get services '-o=custom-columns=NAME:.metadata.name,NODEPORT:.spec.ports[0].nodePort' --no-headers | grep -v '<none>' | sort -k 2n";
  };
}
