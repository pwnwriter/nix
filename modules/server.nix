{ config
, username
, home_dir
, ...
}:

{
  home = {
    username = "${username}";
    homeDirectory = "${home_dir}";
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
