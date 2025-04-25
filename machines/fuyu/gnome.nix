{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
  atomix # puzzle game
  epiphany # web browser
  evince # document viewer
  geary # email reader
  gedit # text editor
  gnome-characters
  gnome-music
  gnome-terminal
  gnome-tour
  hitori # sudoku game
  iagno # go game
  tali # poker game
]);

}
