{ config
, pkgs
, ...
}: {

  home = {
    username = "wood";
    homeDirectory = "/home/wood";
    stateVersion = "23.05";
  };

  imports =
    [
      ./pkgs.nix
      ./shell.nix
      ./apps.nix
    ];

  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
}
