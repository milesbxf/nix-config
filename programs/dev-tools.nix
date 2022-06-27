{ pkgs, ...}:
{
  home.packages = with pkgs; [
    aws-vault
    awscli2
    conftest
    cfssl
    dua
    gomplate
    httpie
    kubie
    kustomize
    packer
    poetry
    python38
    qrencode
    sd
    stern
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
