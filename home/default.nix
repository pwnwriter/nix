{ config
, ...
}: {
  home.username = "pwnwriter";
  home.homeDirectory = "/Users/pwnwriter";
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";

  imports =
    [
      ./pkgs.nix
      ./shell.nix
      ./apps.nix
    ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
