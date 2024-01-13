{ config, pkgs, ... }:

{
  home.username = "pwn";
  home.homeDirectory = "/home/pwn";

 imports = [
    ./programs
  ];

  home.packages = with pkgs; [
  git-cliff
  slurp

  eza
  starship
  zoxide
  just
  ripgrep
  grim
  bat
  
  wofi
  wl-clipboard
  wf-recorder
  hyprpaper
  alacritty
  ];

#  programs.starship = {
#    enable = true;
#    settings = {
#      add_newline = false;
#      aws.disabled = true;
#      gcloud.disabled = true;
#      line_break.disabled = true;
#    };
#  };
#
#  programs.alacritty = {
#    enable = true;
#    settings = {
#      env.TERM = "xterm-256color";
#      font = {
#        size = 12;
#        draw_bold_text_with_bright_colors = true;
#      };
#      scrolling.multiplier = 5;
#      selection.save_to_clipboard = true;
#    };
#  };
#
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
