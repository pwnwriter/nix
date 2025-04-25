{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  programs.zsh.initExtra = ''
    bindkey -s '^y' '"\C-u${pkgs.yazi}/bin/yazi\n"'
  '';
}
