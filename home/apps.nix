{ config, pkgs, lib, ... }:

{

  programs.git = {
    enable = true;
    userName = "pwnwriter";
    userEmail = "hey@pwnwriter.xyz";
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
      PASSWORD_STORE_KEY = "pwned";
      PASSWORD_STORE_CLIP_TIME = "30";
    };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = false; # https://github.com/NixOS/nix/issues/7273
    };
  };

  home.file = {
    ".config/starship.toml" = { source = ./configs/starship.toml; };
    ".config/wezterm" = { source = ./configs/wezterm; };
  };
}

