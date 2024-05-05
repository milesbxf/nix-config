{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "kubectl-aliases";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "ahmetb";
    repo = "kubectl-aliases";

    rev = "b2ee5dbd3d03717a596d69ee3f6dc6de8b140128";
    sha256 = "sha256-TCk26Wdo35uKyTjcpFLHl5StQOOmOXHuMq4L13EPp0U=";
  };

  dontbuild = true;

  installPhase = ''
    mkdir -p $out
    cat ./.kubectl_aliases | sed -r 's/(kubectl.*) --watch/viddy --differences --interval=1s --shell=zsh \1/g' > $out/.kubectl_aliases
  '';
}
