# Home per-user pkgs

{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git-cliff
    slurp

    eza
    zoxide
    ripgrep
    grim

    bat
    just
    stylua
    pass

    nil
    fzf

    mdbook
    neovim-nightly


    wofi
    wl-clipboard
    wf-recorder
    hyprpaper
    alacritty

    rustup
    #cargo-watch
  ];
}
