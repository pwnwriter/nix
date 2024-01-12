{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    git
    xdg-desktop-portal-hyprland
    zsh
    brave
    alacritty

    ripgrep
    hyprpaper
    cmake
    pavucontrol
    unzip
    pstree
    pipewire
    libcamera


    zoxide
    starship
    neofetch
    bat
    eza
    acpi
    doas
    pulseaudio
    wl-clipboard
    wofi

    wireplumber
    tmux
    wf-recorder
    imagemagick
    mpv
    just

    nsxiv
    jq
    tree
    grim
  ];
}

