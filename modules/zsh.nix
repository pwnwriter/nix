{ config, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    KEYTIMEOUT = 15;

    XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
    XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";

    ZDOTDIR = "${config.xdg.configHome}/zsh";

    GOPATH = "${config.xdg.dataHome}/go";

    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";

    LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    PYTHONSTARTUP = "${config.xdg.configHome}/python/pythonrc";
    SSH_HOME = "${config.xdg.configHome}/ssh/ssh_config";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      expireDuplicatesFirst = true;
      ignoreSpace = false;
      save = 15000;
      share = true;
    };

    shellAliases = {
      vi = "vi -i NONE";
      v = "nvim";
      vim = "nvim";

      cat = "bat";
      ls = "eza --icons  -T -L 1 -x";
      ll = "eza --icons  -T -L 2 -x";
      cp = "cp -iv";
      bc = "bc -ql";

      wget = "wget --no-hsts";
      gcl = "git clone --depth=1 --filter=blob:none";

      ".." = "cd ..";
      "..." = "cd ../../";
    };

    initExtra = ''
      stty -ixon
      zle -N up-line-or-beginning-search;
      zle -N down-line-or-beginning-search;

      bindkey -v '^?' backward-delete-char;
      bindkey -M viins 'jj' vi-cmd-mode;
      bindkey -s '^y' '^uyazi\n'


      function zle-keymap-select() {
        case $KEYMAP in
          vicmd) echo -ne '\e[1 q' ;;        # block
          viins | main) echo -ne '\e[5 q' ;; # beam
        esac
      };
      zle-line-init() {
        zle -K viins
        echo -ne "\e[5 q"
      };

      zle -N zle-keymap-select;
      zle -N zle-line-init;

      echo -ne '\e[5 q';
      preexec() { echo -ne '\e[5 q'; };
    '';
  };
}
