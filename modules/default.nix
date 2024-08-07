{ config, ... }:

let
  modules = [
    ./bat.nix
    ./git.nix
    ./gpg.nix
    ./ssh.nix
    ./zsh.nix
    ./pass.nix
    ./pkgs.nix
    ./yazi.nix
    ./zoxide.nix
    ./starship.nix
    ./dedicated.nix
    ./direnv.nix
    ./nix.nix
  ];
in
{
  imports = modules;

  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
