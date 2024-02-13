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

    bat
    stylua
    pass

    nil
    fzf

    mdbook

    rustup
    wezterm

    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

  ];
}
