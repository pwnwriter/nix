{ pkgs, lib, ... }:
{
  config = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    home.packages = [ ];

    # Make fonts from home.packages (Lilex Nerd Font) visible to fontconfig,
    # so Ghostty / GTK apps on elliot can find them.
    fonts.fontconfig.enable = true;
  };
}
