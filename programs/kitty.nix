{ config, pkgs, ...}:
let userlib = import ../userlib {}; in 
{
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
    macos_traditional_fullscreen = "yes";
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

    background  = "#282828";
    foreground  = "#ebdbb2";
    cursor                = "#928374";
    selection_foreground  = "#928374";
    selection_background  = "#3c3836";
    color0 = "#282828";
    color8 = "#928374";
    # red
    color1 = "#cc241d";
    # light red
    color9 = "#fb4934";
    # green
    color2 = "#98971a";
    # light green
    color10 = "#b8bb26";
    # yellow
    color3 = "#d79921";
    # light yellow
    color11 = "#fabd2d";
    # blue
    color4 = "#458588";
    # light blue
    color12 = "#83a598";
    # magenta
    color5 = "#b16286";
    # light magenta
    color13 = "#d3869b";
    # cyan
    color6 = "#689d6a";
    # lighy cyan
    color14 = "#8ec07c";
    # light gray
    color7 = "#a89984";
    # dark gray
    color15 = "#928374";
  };
}
