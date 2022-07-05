self: super: {
  kustomize_3 = super.buildGoModule rec {
    pname = "kustomize_3";
    version = "3.8.9";
    # rev is the commit of the tag, mainly for kustomize version command output
    rev = "f30fea4c072c794e9b936f20bd1592d9fa25d976";

    ldflags = let t = "sigs.k8s.io/kustomize/api/provenance"; in [
      "-s -w"
      "-X ${t}.version=${version}"
      "-X ${t}.gitCommit=${rev}"
    ];

    src = super.fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "kustomize";
      rev = "kustomize/v${version}";
      sha256 = "sha256-kOEaD52qJUHuKlLvucJJuNbYRjZz/jQmL0T78l5GFhU=";
    };

    doCheck = true;

    # avoid finding test and development commands
    sourceRoot = "source/kustomize";

    vendorSha256 = "sha256-QoOsHK6k6DRtMcVDltnRcK1i/tbEDTRA6NKfR+jOkjI=";

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