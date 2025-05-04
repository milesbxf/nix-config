{pkgs, ...}: {
  home.packages = with pkgs; [
    age
    age-plugin-yubikey
    argocd
    asciinema
    aws-iam-authenticator
    #    aws-vault
    awscli2
    bandwhich
    bat-extras.batgrep
    cargo
    cassandra
    cfssl
    cloc
    conftest
    dialog
    dogdns
    dua
    dust
    eza
    fd
    gawk
    #    gnupg
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
    nil
    p7zip
    poetry
    procs
    pv
    #   python38
    qrencode
    qrencode
    reattach-to-user-namespace
    ripgrep
    rustc
    sd
    shellcheck
    stern
    terragrunt
    tldr
    tokei
    viddy
    yazi
    yq-go
  ];

  programs = {
    bash.enable = true;
    bat.enable = true;
    fzf.enable = true;
    gh.enable = true;
    gpg.enable = false;
    go = {
      package = pkgs.go;
      goPath = "";
      enable = false;
    };
    htop.enable = true;
    pet.enable = true;
    zoxide.enable = true;
  };

  home.sessionPath = ["$HOME/bin" "/usr/local/kubebuilder/bin" "$HOME/.cargo/bin"];
}
