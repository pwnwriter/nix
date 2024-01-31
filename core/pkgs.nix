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


    acpi
    doas

    xdg-desktop-portal-hyprland
    brave

    pavucontrol
    pipewire
    wireplumber


    pulseaudio

    tmux
    imagemagick
    mpv

    lua-language-server
    lua

  ];
}

