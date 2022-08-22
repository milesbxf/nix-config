{ pkgs, ...}:
{
  home.packages = with pkgs; [
    _1password
    argocd
    asciinema
    aws-iam-authenticator
    aws-vault
    awscli2
    bat-extras.batgrep
    cassandra
    cfssl
    cloc
    conftest
    dialog
    dogdns
    dua
    exa
    fd
    gawk
    gnupg
    gnused
    gnused
    gomplate
    graphviz
    httpie
    httpie
    httpstat
    jq
    jsonnet
    k9s
    krew
    kubectl
    kubectl-aliases
    kubectx
    kubernetes-helm
    kubie
#    kustomize_3
#    kustomize
#    opa
    p7zip
    packer
    poetry
    pv
    python38
    qrencode
    qrencode
    reattach-to-user-namespace
    ripgrep
    sd
    shellcheck
    stern
    terragrunt
    tldr
    vagrant
    viddy
    yq-go
  ];

  programs = {
    bash.enable = true;
    bat.enable = true;
    fzf.enable = true;
    gh.enable = true;
    gpg.enable = true;
    go = {
      package = pkgs.go;
      goPath = "";
      enable = true;
    };
    htop.enable = true;
    pet.enable = true;
    zoxide.enable = true;
  };

  home.sessionPath = [ "$HOME/bin" "/usr/local/kubebuilder/bin" "$HOME/.cargo/bin"];
}
