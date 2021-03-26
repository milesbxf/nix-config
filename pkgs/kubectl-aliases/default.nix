{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "kubectl-aliases";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "ahmetb";
    repo = "kubectl-aliases";

    rev = "9f8948e7c3ca7b4c4c6cdc1461094bce08da758c";
    sha256 = "1k3b48gy31ibg8dswas7v3vraybr947ywdqmwbn67w434i3jxkfn";
  };

  dontbuild = true;

  installPhase = ''
    mkdir -p $out
    cp ./.kubectl_aliases $out/.kubectl_aliases
  '';
}

