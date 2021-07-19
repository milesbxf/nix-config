{ pkgs, ...}:
{
  home.packages = with pkgs; [
    aws-vault
    awscli2
    cfssl
    dua
    gomplate
    httpie
    hugo
    kubie
    kustomize
    packer
    nodejs-15_x
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
    package = pkgs.go_1_15;
    goPath = "";
    enable = true;
  };

  home.sessionPath = [ "$HOME/bin" "/usr/local/kubebuilder/bin" "$HOME/.cargo/bin"];
}
