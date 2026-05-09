{ pkgs, ... }:
{
  home.packages = [ pkgs.nerd-fonts.lilex ];

  programs.ghostty = {
    enable = true;
    package = null; # installed manually

    settings = {
      shell-integration = "zsh";
      auto-update = "off";

      theme = "dark:catppuccin mocha,light:rose pine dawn";
      background-opacity = 0.80;
      background-blur-radius = 30;

      window-padding-x = "40,40";
      window-padding-y = "20,30";
      window-colorspace = "display-p3";
      font-family = "Lilex Nerd Font Mono Medium";

      mouse-hide-while-typing = true;

      macos-titlebar-style = "tabs";
      window-subtitle = "false";

      quick-terminal-position = "left";
      shell-integration-features = "no-cursor,sudo,no-title,ssh-terminfo";

      custom-shader = "shaders/cursor.glsl";

      keybind = [
        "global:cmd+shift+o=toggle_quick_terminal"
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
