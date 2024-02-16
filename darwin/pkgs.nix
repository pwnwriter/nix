{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Development Tools:
    gcc
    rustup

    # Editors:
    neovim

    # Terminal Emulators:
    wezterm

    # File and Text Search:
    ripgrep
    fzf

    # Version Control and Encryption:
    gnupg
    pass

    # File Navigation:
    tree
    zoxide
    eza

    # System Monitoring:
    htop
    neofetch

    # Utilities:
    just
    bat
    stylua
    nixpkgs-fmt
    nil
    lua-language-server
    mdbook
    yazi
    presenterm
  ];

  environment.shells = with pkgs; [
    zsh
  ];
}
