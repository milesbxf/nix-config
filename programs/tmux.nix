{ pkgs, ...}:
{
  programs.tmux.enable = true;
  programs.tmux.enableFzf = true;
  programs.tmux.enableMouse = true;
  programs.tmux.enableSensible = true;
  programs.tmux.enableVim = true;

  programs.tmux.extraConfig = "";
}
