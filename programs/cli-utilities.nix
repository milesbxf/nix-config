{ pkgs, ...}:
{
  home.packages = with pkgs; [
    _1password
    asciinema
    bat-extras.batgrep
    cloc
    dialog
    gnused
    exa
    jq
    p7zip
    pet
    qrencode
    ripgrep
  ];

  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.gpg.enable = true;
  programs.htop.enable = true;
  programs.zoxide.enable = true;
}
