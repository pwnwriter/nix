{ config, pkgs, ... }:

{
  home.sessionPath = [
    "/home/pwn/.local/bin"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    KEYTIMEOUT = 15;

    XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
    XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";

    ZDOTDIR = "${config.xdg.configHome}/zsh";

    NIX_PATH = "${config.home.homeDirectory}/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels";

    GOPATH = "${config.xdg.dataHome}/go";
    UNISON = "${config.xdg.dataHome}/unison";
    PASSWORD_STORE_DIR = "${config.xdg.dataHome}/pass";

    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    CARGO_TARGET_DIR = "${config.xdg.cacheHome}/target";

    DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    GRADLE_USER_HOME = "${config.xdg.configHome}/gradle";
    LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    NODE_REPL_HISTORY = "${config.xdg.dataHome}/node/node_repl_history";
    PYTHONSTARTUP = "${config.xdg.configHome}/python/pythonrc";
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

    shellAliases = rec {
      sudo = "doas";
      cat = "bat --theme=Catppuccin-macchiato";
      ls = "eza --icons  -T -L 1 -x";
      ll = "eza --icons  -T -L 2 -x";
      v = "nvim";
      cp = "cp -iv";
      bc = "bc -ql";
      yt = "yt-dlp --embed-metadata -i";
      yta = "yt -x -f bestaudio/best";
      ffmpeg = "ffmpeg -hide_banner";
      wget = "wget --no-hsts";
      gcl = "git clone --depth=1 --filter=blob:none";
      sxiv = "nsxiv";
      cdtmp = "cd $(mktemp -d)";

      cd = "z";
      ".." = "cd ..";
      "..." = "cd ...";
    };

    profileExtra = ''
      if [ "$TERM" = "linux" ]; then
        Hyprland
      fi
    '';

    initExtra = ''
      stty -ixon
      zle -N edit-command-line;
      zle -N up-line-or-beginning-search;
      zle -N down-line-or-beginning-search;

      bindkey -v '^?' backward-delete-char;
      bindkey '^e' edit-command-line;
      bindkey -M vicmd '^e' edit-command-line;
      bindkey -M viins 'jj' vi-cmd-mode;

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
