{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Development Tools
    gcc
    rustup
    go

    # Editors
    neovim

    # Terminal Emulators
    wezterm

    # File and Text Search
    ripgrep
    fzf

    # Version Control and Encryption
    gnupg
    pass

    # File Navigation
    tree
    just
    bat
    zoxide
    eza
    yazi
    presenterm

    # System Monitoring
    htop
    neofetch

    # Utilities
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
