{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    aggressiveResize = true;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    keyMode = "vi";
    historyLimit = 50000;

    extraConfig = ''

      set -g mouse on

      # window movement
      unbind p
      unbind n
      unbind [
      bind [ previous-window
      bind ] next-window

      # more vi-like copy
      bind Escape copy-mode
      bind p paste-buffer

      # theming
      set -g default-terminal "screen-256color"
      set-option -ga terminal-overrides ",xterm-256color:Tc"

      set-window-option -g clock-mode-colour colour24
      set-window-option -g mode-style fg=colour196,bg=colour238,bold

      set -g pane-border-style fg=colour239
      set -g pane-active-border-style fg=colour237

      set -g status-left-style 'none'
      set -g status-left "#{prefix_highlight} #[fg=colour241, bg=colour223, nobold, noitalics, nounderscore]"
      set -g status-left-length '60'

      set-window-option -g window-status-current-format "#[fg=colour239, bg=colour248, :nobold, noitalics, nounderscore]#[fg=colour239, bg=colour214] #I #[fg=colour239, bg=colour214, bold] #W #[fg=colour214, bg=colour223, nobold]"
      set-window-option -g window-status-format "#[fg=colour237,bg=colour250,noitalics]#[fg=colour237,bg=colour250] #I #[fg=colour237, bg=colour250] #W #[fg=colour239, bg=colour223, noitalics]"

      set -g status 'on'
      set -g status-position top
      set -g status-style bg=colour223,fg=colour237,'none'
      set -g status-justify 'left'

      set-window-option -g window-status-style bg=default,fg=colour237,none
      set-window-option -g window-status-current-style bg=colour214,fg=colour237,bold


      set-window-option -g window-status-activity-style bg=colour223,fg=colour241

      set-window-option -g window-status-bell-style fg=colour255,bold,bg=colour1

      set -g message-style bg=colour250,fg=colour237
      set -g message-command-style bg=colour250,fg=colour237

      set-option -g display-panes-active-colour colour250 #fg2
      set-option -g display-panes-colour colour237 #bg1

      # status bar

      set-option -g visual-activity off
      set-option -g visual-bell off
      set-option -g visual-silence off
      set-window-option -g monitor-activity off
      set-option -g bell-action none


      # reload config
      bind-key R source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"
      bind-key M split-window -h "$EDITOR ~/.tmux.conf"

      set -g status-justify left
      set -g status-interval 2

    '';

    shortcut = "a";
    sensibleOnTop = true;

    plugins = with pkgs.tmuxPlugins; [
      pain-control
      vim-tmux-navigator
      open
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      prefix-highlight
      yank
    ];
  };
}
