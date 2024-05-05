self: super: {
  kubectl-aliases = super.callPackage ./kubectl-aliases {};
  git-aliases-zsh = super.callPackage ./git-aliases-zsh {};
  prezto-prompt-mpor = super.callPackage ./prezto-prompt-mpor {};
}
