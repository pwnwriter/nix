{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    xdg-desktop-portal-hyprland

    cmake
    pavucontrol
    unzip
    pstree
    pipewire
    libcamera
    brave


    neofetch
    acpi
    doas
    pulseaudio

    wireplumber
    tmux
    imagemagick
    mpv

    nsxiv
    tree
  ];
}

