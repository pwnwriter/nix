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
    ./fastfetch.nix
    ./direnv.nix
    ./fzf.nix
    ./nix.nix
    ./eza.nix
    ./ghostty.nix
    ./gtk.nix
    ./cava.nix
    ./tmux.nix
    # ./neovide.nix
  ];
in
{
  imports = modules;
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
}
