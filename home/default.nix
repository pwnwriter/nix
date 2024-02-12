{ config, pkgs, lib, input, ... }:

{
  home.username = "pwnwriter";
  home.homeDirectory = "/Users/pwnwriter";
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";

  imports = [ ./pkgs.nix ./shell.nix  ./apps.nix ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}

