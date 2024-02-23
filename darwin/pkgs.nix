{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
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
  ];

  environment.shells = with pkgs; [
    zsh
  ];
}
