{ theme, ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    # Rosé Pine colours from the active palette (see modules/theme.nix).
    colors = {
      "fg" = theme.subtle;
      "bg" = theme.base;
      "hl" = theme.rose;
      "fg+" = theme.text;
      "bg+" = theme.overlay;
      "hl+" = theme.rose;
      "border" = theme.highlightMed;
      "header" = theme.pine;
      "gutter" = theme.base;
      "spinner" = theme.gold;
      "info" = theme.foam;
      "separator" = theme.highlightMed;
      "pointer" = theme.iris;
      "marker" = theme.love;
      "prompt" = theme.subtle;
    };
  };
}
