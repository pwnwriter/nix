{ config, ... }:

{
  imports =
    [
      ./pkgs.nix
      ./zsh.nix
      ./apps.nix
      ./starship.nix
    ];

  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
}
