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
