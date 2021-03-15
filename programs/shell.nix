{ pkgs, ...}:
{
  programs.zsh = {
    enable = true;  # default shell on catalina
    enableCompletion = true;
    defaultKeymap = "viins";

    history = {
      extended = true;
      save = 9223372036854775807;
      size = 9223372036854775807;
      path = ".zsh_history";
    };

    prezto = {
      enable = true;

      editor = {
        keymap = "vi";
        promptContext = true;
      };

      prompt = {
        theme = "pure";
      };
      python = {
        virtualenvAutoSwitch = true;
        virtualenvInitialize = true;
      };

      terminal = {
        autoTitle = true;
      };

      tmux = {
        autoStartLocal = true;
      };
    };
  };

}
