{ config, pkgs, lib, inputs, ... }:

{
  config.home.file = {
    ".config/alacritty" = {source = ./config/alacritty;};
    ".config/cava" = {source = ./config/cava;};
    ".config/wofi" = {source = ./config/wofi;};
    ".config/bat" = {source = ./config/bat;};
  };

  imports = [ 
    ./git.nix 
    ./shell.nix 
    ./starship.nix 
    ./zoxide.nix
    ./tmux.nix
  ];
}
