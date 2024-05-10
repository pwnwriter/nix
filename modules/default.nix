{ config, ... }:

{
  imports =
    [
    ./bat.nix
    ./git.nix
    ./gpg.nix
    ./ssh.nix
    ./zsh.nix
    ./pash.nix
    ./pkgs.nix
    ./yazi.nix
    ./zoxide.nix
    ./starship.nix
    ./dedicated.nix
    ];

  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
}
