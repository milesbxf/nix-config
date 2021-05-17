{ pkgs, ...}:
{
  home.packages = with pkgs; [
      # pkgs.prezto-prompt-mpor
      nix-zsh-completions
  ];

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
      save = 1000000000;
      size = 1000000000;
      path = ".zhistory";
      share = true;
      ignoreDups = true;
    };

    initExtraBeforeCompInit = ''
      autoload bashcompinit && bashcompinit
    '';

    prezto = {
      enable = true;

      editor = {
        keymap = "vi";
        promptContext = true;
      };

      extraConfig = ''
        export __HM_SESS_VARS_SOURCED=""
        source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

        # Set key mode for INSERT mode
        zstyle ':prezto:module:editor:info:keymap:primary' format $'%{\e[5 q%}'"%F{167}''${i_fa_chevron_right}%F{108}''${i_fa_chevron_right}%F{208}''${i_fa_chevron_right}"
        # Set key mode for NORMAL mode
        zstyle ':prezto:module:editor:info:keymap:alternate' format $'%{\e[1 q'"%F{142}''${i_fa_chevron_left}%F{214}''${i_fa_chevron_left}%F{109}''${i_fa_chevron_left}"

        # uncomment to temporarily iterate on mpor
        # fpath+=(~/src/github.com/milesbxf/zsh-prompt-mpor)
        # autoload -Uz promptinit
        # promptinit
        # prompt mpor
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
    # fpath+=("${pkgs.prezto-prompt-mpor}/share/zsh/site-functions")
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
          sd "''${1}" "''${2}" $(rg "''${1}" -l)
      }

      [[ -s ~/.zshrc-local ]] && source ~/.zshrc-local

      mkdir -p ~/.zfunc

      if [ $commands[poetry] ]; then
        poetry() {
          unfunction "$0"
          rm -f ~/.zfunc/_poetry
          poetry completions zsh > ~/.zfunc/_poetry
          $0 $@
        }
      fi

      if [ $commands[kustomize] ]; then
        kustomize() {
          unfunction "$0"
          rm -f ~/.zfunc/_kustomize
          kustomize completion zsh > ~/.zfunc/_kustomize
          $0 $@
        }
      fi

      rm -f ~/.zfunc/_kubectl && kubectl completion zsh > ~/.zfunc/_kubectl
      rm -f ~/.zfunc/_aws-vault &&aws-vault --completion-script-zsh  > ~/.zfunc/_aws-vault

      complete -o nospace -C ${pkgs.terraform}/bin/terraform terraform

      fpath+=(~/.zfunc)
  '';

    shellAliases = {
      le = "exa --long --tree --colour-scale --header --group --time-style=long-iso --ignore-glob='*.pyc' --git";
      md = "mkdir -p";
      far = "find_and_replace";
      ghc = "github_clone";

      nix-build-package = "nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}'";
    };

  };
}
