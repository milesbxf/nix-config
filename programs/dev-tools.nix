{ pkgs, ...}:
{
  home.packages = with pkgs; [
    argocd
    aws-iam-authenticator
    aws-vault
    awscli2
    cassandra
    conftest
    cfssl
    dua
    gomplate
    httpie
    jsonnet
    kubie
    kubectl
    kustomize
    k9s
    opa
    packer
    poetry
    python38
    qrencode
    sd
    shellcheck
    stern
    terragrunt
    vagrant
    viddy
    yq-go
  ];

  programs.gh.enable = true;
  programs.go = {
    package = pkgs.go;
    goPath = "";
    enable = true;
  };

  home.sessionPath = [ "$HOME/bin" "/usr/local/kubebuilder/bin" "$HOME/.cargo/bin"];
}
