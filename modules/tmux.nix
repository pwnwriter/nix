{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./configs/tmux.conf;
  };
}
