{ config, ... }:

let
  modules = [
    ./theme.nix
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
    ./fastfetch.nix
    ./direnv.nix
    ./fzf.nix
    ./eza.nix
    ./jj.nix
    ./agenix.nix
    ./ghostty.nix
    ./herdr.nix
    ./linux.nix
  ];
in
{
  imports = modules;
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
