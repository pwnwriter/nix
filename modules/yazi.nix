{ pkgs, ... }:

let
  src = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "yazi";
    rev = "main";
    sha256 = "sha256-a2X9WToZmctD1HZVqN9A512iPd+3dtjRloBEifgteF4=";
    fetchSubmodules = false;
  };
in
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file.".config/yazi/theme.toml".source = "${src}/themes/mocha.toml";
}
