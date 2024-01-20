{ config, pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "pwnwriter";
    userEmail = "hey@pwnwriter.xyz";
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      palette = "catppuccin_macchiato";
      format = lib.concatStrings [ "$directory" "$character" ];

      right_format = lib.concatStrings ["$git_branch" ];

      character = {
        success_symbol = "[ ](red)";
        error_symbol = "[ ](rosewater)";
        vimcmd_symbol = "[ ](green)";
      };

      directory = {
        truncation_length = 1;
        style = "bold pink";
      };

      git_branch = {
        symbol = "󱐚 ";
        truncation_length = 10;
        truncation_symbol = "";
        format = lib.concatStrings [ "[ $symbol$branch]($style) " ];
        style = " rosewater";
      };

      palettes = {
        catppuccin_macchiato = {
          rosewater = "#f4dbd6";
          flamingo = "#f0c6c6";
          pink = "#f5bde6";
          mauve = "#c6a0f6";
          red = "#ed8796";
          maroon = "#ee99a0";
          peach = "#f5a97f";
        };
      };
    };
  };
}
