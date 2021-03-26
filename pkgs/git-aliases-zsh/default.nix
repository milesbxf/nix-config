{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "git-aliases-zsh";
  version = "1.0.0";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/040aadf7c460112386d23786d8d3f5d2dcfbfeb4/plugins/git/git.plugin.zsh";
    sha256 = "187399c5lx76jrg0mai0xdmfr66yl5zjnk1zilgf4vmz7q0qwc7l";
  };

  dontbuild = true;

  installPhase = ''
    mkdir -p $out
    ls -al
    cp ./git.plugin.zsh $out/aliases
  '';

  unpackPhase = ''
    set -x
    for srcFile in $src; do
      cp $srcFile $(stripHash $srcFile)
    done
  '';
}

