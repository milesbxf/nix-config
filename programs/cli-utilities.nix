{ pkgs, ...}:
{
  home.packages = with pkgs; [
    asciinema
    bat
    cloc
    dialog
    gnused
    gnupg
    exa
    jq
    p7zip
    pet
    qrencode
    ripgrep
    zoxide
  ];
}
