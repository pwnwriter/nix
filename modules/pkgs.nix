{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    go
    trunk
    rustup

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

    darwin.apple_sdk.frameworks.SystemConfiguration
    pkg-config
    openssl
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
