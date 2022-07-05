self: super: {
  kustomize_3 = super.buildGoModule rec {
    pname = "kustomize_3";
    version = "3.8.0";
    # rev is the commit of the tag, mainly for kustomize version command output
    rev = "6a50372dd5686df22750b0c729adaf369fbf193c";

    ldflags = let t = "sigs.k8s.io/kustomize/api/provenance"; in [
      "-s -w"
      "-X ${t}.version=${version}"
      "-X ${t}.gitCommit=${rev}"
    ];

    src = super.fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "kustomize";
      rev = "kustomize/v${version}";
      sha256 = "sha256-PmZdLamV+CjIVyEvPZ5lmTIw13rSKCfiQwJ2Eyx+Bu0=";
    };

    doCheck = true;

    # avoid finding test and development commands
    sourceRoot = "source/kustomize";

    vendorSha256 = "sha256-vO0kXvojC0b3pEEVo7pvND8UqxvqntIYEEFmm+ID5A8=";

    meta = with super.lib; {
      description = "Customization of kubernetes YAML configurations";
      longDescription = ''
        kustomize lets you customize raw, template-free YAML files for
        multiple purposes, leaving the original YAML untouched and usable
        as is.
      '';
      homepage = "https://github.com/kubernetes-sigs/kustomize";
      license = licenses.asl20;
      maintainers = with maintainers; [ carlosdagos vdemeester zaninime Chili-Man saschagrunert ];
      mainProgram = "kustomize";
    };
  };
}