{ config, pkgs, ...}:
{

  imports = [
    ../nix/userinfo.nix
  ];

  home.packages = [
    pkgs.git-hub
    pkgs.git-aliases-zsh
  ];

  programs.git = {
    enable = true;
    userName = config.userinfo.username;
    userEmail = config.userinfo.email;

    delta = {
      enable = true;
      options = {
        syntax-theme = "Monokai Extended Light";
      };
    };

    signing = if config.userinfo.gpgKeyName != "" then {
      key = config.userinfo.gpgKeyName;
      signByDefault = true;
    } else {
      key = "";
      signByDefault = false;
    };

    extraConfig = {
      core = {
        autocrlf = "input";
        excludesfile = "/Users/milesbryant/.gitignore-global";
      };
      commit.template = "~/.gitmessage";
      push.default = "current";
      pull.rebase = true;
      "remote \"origin\"".prune = true;
      init.defaultBranch = "main";
      merge.tool = "vimdiff";
      mergetool.prompt = true;
      "mergetool \"vimdiff\"".cmd = "nvim -f -c \"Gdiff\" \"$MERGED\"";
      "url \"https://github.com/\"".insteadOf = "gh:";
      "url \"https://gist.github.com/\"".insteadOf = "gist:";
      "url \"https://bitbucket.org/\"".insteadOf = "bb:";
      "url \"git@github.com:monzo/\"".insteadOf = "mz:";
    };
  };

  programs.zsh.initExtra = ''
    source ${pkgs.git-aliases-zsh}/aliases
  '';
}
