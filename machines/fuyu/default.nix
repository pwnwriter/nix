{ config, ... }:

let
  modules = [
    ./hyprland.nix
    ./waybar.nix
  ];
in
{
  imports = modules;
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
