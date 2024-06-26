{ pkgs, ... }:

let
  src = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/yazi/main/themes/mocha.toml";
    sha256 = "1s66068fjyd03hfzg8sb24lxk0n3ix5mgsaynw59rqcwyj3ix3p3";
  };
in
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

home.file.".config/yazi/theme.toml".source = src;
}
