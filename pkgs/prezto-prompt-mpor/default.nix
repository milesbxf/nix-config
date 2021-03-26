{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "kubectl-aliases";
  version = "1.0.0";

  src = [./src];

  dontbuild = true;

  installPhase = ''
    mkdir -p $out
    ls -al
  '';

  unpackPhase = ''
  '';
}


