self: super:
    let version = "2.37.0";
in {
  git = super.git.overrideAttrs(old: {
    inherit version;

    src = super.fetchurl {
      url = "https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz";
      sha256 = "sha256-n3+hcRvQDE7D3eL+REB9wT8S5HcrXjxypY20wHSVQR8=";
    };
  });
}
