{ config, pkgs, lib, inputs, ... }:

{
  config.home.file = {
    ".config/alacritty" = {source = ./configs/alacritty;};
    ".config/cava" = {source = ./configs/cava;};
    ".config/bat" = {source = ./configs/bat;};
    ".config/tmux" = {source = ./configs/tmux;};
  };

  imports = [ 
    ./shell.nix 
    ./apps.nix
  ];
}
