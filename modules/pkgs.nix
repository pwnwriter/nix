{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    clang
    rustup
    go
    trunk

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
    lazygit
    jq

    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
