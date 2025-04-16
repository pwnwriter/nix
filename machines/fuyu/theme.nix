{ pkgs, config, ... }:

{
  stylix.enable = true;

  stylix.autoEnable = false;

  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "jetbrains-mono";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "DejaVu Sans";
    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "DejaVu Sans Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
