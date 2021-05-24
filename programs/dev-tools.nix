{ pkgs, ...}:
{
  home.packages = with pkgs; [
    aws-vault
    awscli2
    cfssl
    gomplate
    httpie
    hugo
    kubie
    kustomize
    packer
    poetry
    python27
    python38
    qrencode
    sd
    stern
    terraform_0_14
    vagrant
    yq
  ];

  programs.gh.enable = true;
  programs.go = {
    goPath = "";
    enable = true;
  };

  home.sessionPath = [ "$HOME/bin" "/usr/local/kubebuilder/bin" ];
}
