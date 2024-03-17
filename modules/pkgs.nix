{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    go
    trunk
    rustup

    zig
    zls

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
    aria2

    darwin.apple_sdk.frameworks.Security
    darwin.apple_sdk.frameworks.CoreFoundation
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
