{
  programs.ghostty = {
    enable = true;
    package = null; # installed manually

    settings = {
      shell-integration = "zsh";
      auto-update = "off";

      theme = "dark:Catppuccin Mocha,light:Rose Pine Dawn";
      background-opacity = 0.80;

      window-padding-x = "40,40";
      window-padding-y = "20,30";
      window-colorspace = "display-p3";

      mouse-hide-while-typing = true;

      macos-titlebar-style = "transparent";
      gtk-titlebar = false;

      quick-terminal-position = "center";
      shell-integration-features = "no-cursor,sudo,no-title";

      custom-shader = "shaders/cursor.glsl";

      keybind = [
        "cmd+shift+o=toggle_quick_terminal"
        "cmd+s>z=toggle_split_zoom"
        "cmd+s>j=goto_split:bottom"
        "cmd+s>k=goto_split:top"
        "cmd+s>h=goto_split:left"
        "cmd+s>l=goto_split:right"
        "cmd+s>\\=new_split:right"
        "cmd+s>-=new_split:down"
      ];
    };
  };

  home.file.".config/ghostty/shaders/cursor.glsl".source = ./configs/ghostty/shaders/cursor.glsl;
}
