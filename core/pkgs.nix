# System pkgs for all users

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    cmake
    unzip
    gcc
    pstree
    file
    nsxiv
    tree
    fx
    aria2


    acpi
    doas

    xdg-desktop-portal-hyprland
    brave

    pavucontrol
    wireplumber


    pulseaudio

    tmux
    imagemagick
    mpv

    lua-language-server
    lua

  ];
}

