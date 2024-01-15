{ config, pkgs, ... }:
{
  config.home.file = {
    ".config/alacritty" = {source = ./config/alacritty;};
    ".config/cava" = {source = ./config/cava;};
    ".config/wofi" = {source = ./config/wofi;};
    ".config/hypr" = {source = ./config/hypr;};
    ".config/bat" = {source = ./config/bat;};
  };
}
