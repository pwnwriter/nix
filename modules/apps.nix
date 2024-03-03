{ config, ... }:

{

  programs.git = {
    enable = true;
    userName = "pwnwriter";
    userEmail = "hey@pwnwriter.xyz";
  };

  programs.zsh = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  programs.ssh = {
    enable = true;
    userKnownHostsFile = "${config.xdg.dataHome}/ssh/known_hosts";
    matchBlocks = {
      "*" = {
        identityFile = "${config.xdg.dataHome}/ssh/id_rsa";
        extraOptions = {
          AddKeysToAgent = "yes";
          UseKeychain = "yes";
        };
      };
    };
  };

  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_KEY = "B681763F9B5BDF279A139E0C0544A89BC51920AA";
      PASSWORD_STORE_CLIP_TIME = "30";
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file = {
    ".config/starship.toml" = { source = ./configs/starship.toml; };
    ".config/wezterm" = { source = ./configs/wezterm; };
  };
}

