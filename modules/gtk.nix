{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Light-Cursors";
    package = pkgs.catppuccin-cursors.mochaPink;
    size = 16;
    gtk.enable = true;
  };

  gtk = {
    enable = true;
    # cursorTheme.name= pkgs.Catppuccin-Mocha-Light-Cursors;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };
}
