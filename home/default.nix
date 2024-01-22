{ config, pkgs, lib, input, ... }:

{
  home.username = "pwn";
  home.homeDirectory = "/home/pwn";
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";

  imports = [ ./dedicated.nix ];

  home.packages = with pkgs; [
    git-cliff
    slurp

    eza
    zoxide
    ripgrep
    grim

    bat
    just
    stylua
    pass
    skim
    nil
    mdbook

    neovim-nightly


    wofi
    wl-clipboard
    wf-recorder
    hyprpaper
    alacritty

    rustup
    #cargo-watch
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}