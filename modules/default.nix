{ config, ... }:

{
  imports =
    [
      ./pkgs.nix
      ./shell.nix
      ./apps.nix
      ./starship.nix
    ];

  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
}
