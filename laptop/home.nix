{ config, pkgs, lib, ... }:

{
  home.username = "pwn";
  home.homeDirectory = "/home/pwn";
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";

  imports = [ ./programs ];

  home.packages = with pkgs; [
    git-cliff
    slurp

    eza
    zoxide
    ripgrep
    grim
    bat
    just
    neovim

    rustup

    wofi
    wl-clipboard
    wf-recorder
    hyprpaper
    alacritty
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
