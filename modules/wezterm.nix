{
  programs.wezterm = {
    enable = true;
  };

  home.file = {
    ".config/wezterm" = {
      source = ./configs/wezterm;
    };
  };
}
