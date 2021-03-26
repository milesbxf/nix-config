{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "prezto-prompt-mpor";
  version = "1.0.0";

  src = [./src];

  dontbuild = true;

  installPhase = ''
    OUTDIR="''${out}/share/zsh/site-functions"
    mkdir -p $OUTDIR
    cp mpor.zsh $OUTDIR/prompt_mpor_setup
  '';

  unpackPhase = "";
}


