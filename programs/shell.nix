{ pkgs, ...}:
{
  programs.zsh = {
    enable = true;  # default shell on catalina
    enableAutosuggestions = true;
    enableCompletion = true;
    defaultKeymap = "viins";

    autocd = true;
    cdpath = [
      "~/src/"
      "~/src/github.com/"
      "~/src/github.com/milesbxf/"
      "~/src/github.com/monzo/"
    ];

    history = {
      extended = true;
      save = 9223372036854775807;
      size = 9223372036854775807;
      path = ".zhistory";
      share = true;
      ignoreDups = true;
    };

    prezto = {
      enable = true;

      editor = {
        keymap = "vi";
        promptContext = true;
      };

      extraConfig = ''
        # Set key mode for INSERT mode
        zstyle ':prezto:module:editor:info:keymap:primary' format $'%{\e[5 q%}'"%F{167}''${i_fa_chevron_right}%F{108}''${i_fa_chevron_right}%F{208}''${i_fa_chevron_right}"
        # Set key mode for NORMAL mode
        zstyle ':prezto:module:editor:info:keymap:alternate' format $'%{\e[1 q'"%F{142}''${i_fa_chevron_left}%F{214}''${i_fa_chevron_left}%F{109}''${i_fa_chevron_left}"
      '';
      extraModules = [];

      pmodules = [
        "environment"         # general shell options & env vars
        "terminal"            # terminal window and tab titles
        "editor"              # key bindings. Options set in Nix editor block above
        "history"             # history options
        "directory"           # directory options
        "spectrum"            # easier use of 256 color
        "utility"             # "general" aliases/functions
        "completion"          # tab completion
        "prompt"              # prompt themes
        "syntax-highlighting" # zsh-syntax-highlighting
        "tmux"                # tmux aliases/autolaunch options
        "osx"                 # maxOS aliases/functions
      ];

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
    envExtra = ''
      [[ -s ~/.zshenv-local ]] && source ~/.zshenv-local
    '';

    initExtra = ''
      github_clone() {
          [[ -z $1 ]] && echo "Error: ghc requires one argument, e.g. foo/bar" && return 1
          echo "mkdir -p $(dirname ~/src/github.com/$1)"
          mkdir -p $(dirname ~/src/github.com/$1)
          git clone git@github.com:$1 ~/src/github.com/$1
          cd ~/src/github.com/$1
      }

      find_and_replace() {
          sd -i "''${1}" "''${2}" $(rg "''${1}" -l)
      }

      [[ -s ~/.zshrc-local ]] && source ~/.zshrc-local
  '';

    shellAliases = {
      le = "exa --long --tree --colour-scale --header --group --time-style=long-iso --ignore-glob='*.pyc' --git";
      md = "mkdir -p";
      far = "find_and_replace";
      ghc = "github_clone";
    };

  };
}
