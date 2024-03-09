{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      scan_timeout = 10;
      palette = "catppuccin_macchiato";

      format = lib.concatStrings [
        "$directory$character"
      ];

      character = {
        error_symbol =
          lib.concatStrings [
            "[ ](rosewater)"
          ];
        vimcmd_symbol =
          lib.concatStrings [
            "[ ](green)"
          ];
        success_symbol =
          lib.concatStrings [
            "[ ](red)"
          ];
      };

      directory = {
        style = "bold pink";
        truncation_length = 1;
      };

      palettes.catppuccin_macchiato = {
        flamingo = "#f0c6c6";
        maroon = "#ee99a0";
        mauve = "#c6a0f6";
        peach = "#f5a97f";
        pink = "#f5bde6";
        red = "#ed8796";
        rosewater = "#f4dbd6";
      };
    };
  };
}
