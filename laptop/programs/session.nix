{config, ...}: {
  home.sessionPath = [
    "/usr/local/bin"
  ];

  home.sessionVariables = {
    CARGO_REGISTRIES_CRATES_IO_PROTOCOL = "sparse";
    EDITOR = "nvim";
    TERMINAL = "alacritty";
    BROWSER = "brave";

    NOTMUCH_CONFIG = "${config.xdg.configHome}/notmuch-config";
    GTK2_RC_FILES = "${config.xdg.configHome}/gtk-2.0/gtkrc-2.0";
    WGETRC = "${config.xdg.configHome}/wget/wgetrc";
    ZDOTDIR = "${config.xdg.configHome}/zsh";
    ANDROID_SDK_HOME = "${config.xdg.configHome}/android";
    ANSIBLE_CONFIG = "${config.xdg.configHome}/ansible/ansible.cfg";
    WEECHAT_HOME = "${config.xdg.configHome}/weechat";
    MBSYNCRC = "${config.xdg.configHome}/mbsync/config";
    STARSHIP_CONFIG = "${config.xdg.configHome}/starship/config.toml";

    GNUPGHOME = "${config.xdg.dataHome}/gnupg";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    GOPATH = "${config.xdg.dataHome}/go";
    UNISON = "${config.xdg.dataHome}/unison";
    PASSWORD_STORE_DIR = "${config.xdg.dataHome}/pass";

    HISTFILE = "${config.xdg.cacheHome}/zsh/history";
    CARGO_TARGET_DIR = "${config.xdg.cacheHome}/target";

    NIX_PATH = "${config.xdg.dataHome}/.local/share/nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels";

    LESS_TERMCAP_mb = "$(printf '%b' '[1;31m')";
    LESS_TERMCAP_md = "$(printf '%b' '[1;36m')";
    LESS_TERMCAP_me = "$(printf '%b' '[0m')";
    LESS_TERMCAP_so = "$(printf '%b' '[01;44;33m')";
    LESS_TERMCAP_se = "$(printf '%b' '[0m')";
    LESS_TERMCAP_us = "$(printf '%b' '[1;32m')";
    LESS_TERMCAP_ue = "$(printf '%b' '[0m')";
    DICS = "/usr/share/stardict/dic/";
    FZF_DEFAULT_OPTS = "--layout=reverse --height 40%";
    LESS = "-R";
    LESSOPEN = "| /usr/bin/highlight -O ansi %s 2>/dev/null";
    QT_QPA_PLATFORMTHEME = "gtk2";
    AWT_TOOLKIT = "MToolkit wmname LG3D";
  };
}

