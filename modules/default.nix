{ config, ...}:

{
  imports =
    [
      ./pkgs.nix
      ./shell.nix
      ./apps.nix
    ];

  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
}
