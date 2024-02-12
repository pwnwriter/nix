{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    just

    eza
    zoxide
    ripgrep
    
   #neovim-nightly
   
    htop

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
