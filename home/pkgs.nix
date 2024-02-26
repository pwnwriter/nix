{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    rustup
    go

    neovim
    wezterm

    ripgrep
    fzf

    pass

    tree
    just
    bat
    zoxide
    eza
    yazi
    presenterm

    htop
    neofetch

    stylua
    nixpkgs-fmt
    nil
    lua-language-server
    mdbook
    gopls
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
