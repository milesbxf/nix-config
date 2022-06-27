{ pkgs, ...}:
{
  home.packages = with pkgs; [
    _1password
    asciinema
    bat-extras.batgrep
    cloc
    dialog
    dogdns
    gnused
    exa
    fd
    gawk
    gnused
    gnupg
    httpie
    httpstat
    jq
    p7zip
    pv
    qrencode
    reattach-to-user-namespace
    ripgrep
    tldr
  ];

  programs.bash.enable = true;
  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.gpg.enable = true;
  programs.htop.enable = true;
  programs.pet.enable = true;
  programs.zoxide.enable = true;
}
