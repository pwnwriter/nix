{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    just

    tree

    eza
    zoxide
    ripgrep

    htop

    nixpkgs-fmt

    neovim

    bat
    stylua
    pass

    nil
    fzf
    gcc

    mdbook

    rustup
    wezterm

    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

  ];
}
