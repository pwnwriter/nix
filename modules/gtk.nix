{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Light-Cursors";
    package = pkgs.catppuccin-cursors.mochaLight;
    size = 16;
    gtk.enable = true;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };
}
