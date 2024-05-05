{
  config,
  pkgs,
  ...
}: let
  userlib = import ../userlib {};
in {
  home.packages = [pkgs.fantasque-sans-mono];
  programs.kitty.enable = true;

  programs.kitty.font = {
    name = "FantasqueSansMono Nerd Font";
    package = pkgs.fantasque-sans-mono;
  };

  programs.kitty.keybindings = {};
  programs.kitty.settings = {
    adjust_column_width = 0;
    adjust_line_height = 0;
    bell_on_tab = "yes";
    clipboard_control = "write-clipboard write-primary no-append";
    copy_on_select = "no";
    cursor_shape = "block";
    cursor_stop_blinking_after = 0;
    disable_ligatures = "never";
    draw_minimal_borders = "yes";
    editor = ".";
    enable_audio_bell = "no";
    font_size = 14;
    input_delay = 10;
    macos_option_as_alt = "right";
    macos_quit_when_last_window_closed = "yes";
    macos_thicken_font = "0.1";
    macos_traditional_fullscreen = "no";
    macos_window_resizable = "yes";
    mouse_hide_wait = 1;
    open_url_modifiers = "kitty_mod";
    open_url_with = "default";
    rectangle_select_modifiers = "ctrl+alt";
    remember_window_size = "yes";
    repaint_delay = 10;
    scrollback_lines = 1000;
    shell = ".";
    strip_trailing_spaces = "smart";
    sync_to_monitor = "no";
    visual_bell_duration = 1;
    window_alert_on_bell = "yes";

    # https://github.com/wdomitrz/kitty-gruvbox-theme/blob/master/gruvbox_light.conf
    background = "#fbf1c7";
    foreground = "#282828";
    selection_foreground = "#928374";
    selection_background = "#3c3836";

    # white
    color0 = "#fbf1c7";
    color8 = "#282828";

    # red
    color1 = "#cc241d";
    color9 = "#9d0006";

    # green
    color2 = "#98971a";
    color10 = "#79740e";

    # yellow
    color3 = "#d79921";
    color11 = "#b57614";

    # blue
    color4 = "#458588";
    color12 = "#076678";

    # purple
    color5 = "#b16286";
    color13 = "#8f3f71";

    # aqua
    color6 = "#689d6a";
    color14 = "#427b58";

    # black
    color7 = "#7c6f64";
    color15 = "#282828";
  };
}
