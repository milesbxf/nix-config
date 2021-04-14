{ pkgs, ...}:
{
  home.packages = with pkgs; [
    aws-vault
    awscli2
    cfssl
    gomplate
    httpie
    hugo
    kustomize
    kubie
    python27
    python38
    qrencode
    sd
    terraform_0_14
    vagrant
  ];

  programs.gh.enable = true;
  programs.go = {
    goPath = "";
    enable = true;
  };

  home.sessionPath = [ "$HOME/bin" "/usr/local/kubebuilder/bin" ];
}
