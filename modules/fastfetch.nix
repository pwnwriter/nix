{
  programs.fastfetch = {
    enable = true;
  };
  home.file = {
    ".config/fastfetch" = {
      source = ./configs/fastfetch;
    };
  };
}
