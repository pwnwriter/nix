{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wezterm
    gcc
    just

    gnupg

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

    mdbook

    rustup
  ];

  environment.shells = with pkgs; [
    zsh
  ];
}
