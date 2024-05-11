{ lib, pkgs, ... }:

let
  macos_prompt = {
    error_symbol =
      lib.concatStrings [
        "[ ](red)"
      ];
    vimcmd_symbol =
      lib.concatStrings [
        "[ ](green)"
      ];
    success_symbol =
      lib.concatStrings [
        "[ ](rosewater)"
      ];
  };

  linux_prompt = {
    error_symbol =
      lib.concatStrings [
        "[ ](red)"
      ];
    vimcmd_symbol =
      lib.concatStrings [
        "[ ](green)"
      ];
    success_symbol =
      lib.concatStrings [
        "[ ](rosewater)"
      ];
  };

in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      scan_timeout = 10;
      palette = "catppuccin_macchiato";

      format = lib.concatStrings [
        "$directory$character "
      ];

      right_format = lib.concatStrings [
        "$nix_shell"
      ];

      character = if pkgs.stdenv.isDarwin then macos_prompt else linux_prompt;

      directory = {
        style = "bold pink";
        truncation_length = 1;
      };

      nix_shell = {
        impure_msg = "";
        symbol = " ";
        heuristic = true;
        format = "[](fg:#f5bde6 bg:none)[dev $symbol](fg:#131313 bg:#f5bde6)[](fg:#f5bde6 bg:none)";
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

