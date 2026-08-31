{ pkgs, theme, ... }:
{
  programs.bat = {
    enable = true;

    config = {
      pager = "less -FR";
      theme = "rose-pine";
    };

    # Rosé Pine theme generated from the active palette (see modules/theme.nix).
    themes."rose-pine" = {
      src = pkgs.writeTextDir "rose-pine.tmTheme" theme.tmTheme;
      file = "rose-pine.tmTheme";
    };
  };

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}
