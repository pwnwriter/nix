{ lib, pkgs, ... }:

let
  macos_prompt = {
    error_symbol = lib.concatStrings [ "[ ](red)" ];
    vimcmd_symbol = lib.concatStrings [ "[ ](green)" ];
    success_symbol = lib.concatStrings [ "[ ](rosewater)" ];
  };

  linux_prompt = {
    error_symbol = lib.concatStrings [ "[ ](red)" ];
    vimcmd_symbol = lib.concatStrings [ "[ ](green)" ];
    success_symbol = lib.concatStrings [ "[ ](rosewater)" ];
  };

in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    catppuccin = {
      enable = true;
      flavor = "mocha";

    };

    settings = {
      scan_timeout = 10;

      #format = lib.concatStrings [ "$directory$git_branch$git_status$character" ];
      format = lib.concatStrings [ "$directory$git_branch$character" ];

      right_format = lib.concatStrings [ "$nix_shell" ];

      character = if pkgs.stdenv.isDarwin then macos_prompt else linux_prompt;

      directory = {
        style = "bold pink";
        truncation_length = 1;
      };

      nix_shell = {
        impure_msg = "impure";
        pure_msg = "pure";
        unknown_msg = "unknown";
        format = "[$symbol$state]($style)";
        symbol = "󱄅 ";
      };

      git_branch = {
        symbol = "󰊢 ";
        format = "on [$symbol$branch]($style) ";
        truncation_length = 4;
        truncation_symbol = "…/";
        style = "bold green";
      };

      git_status = {
        format = "[\\($all_status$ahead_behind\\)]($style) ";
        style = "bold green";
        conflicted = "󱃞";
        up_to_date = " ";
        untracked = " ";
        ahead = "⇡\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        behind = "⇣\${count}";
        stashed = "󰏗 ";
        modified = " ";
        staged = "[++\\($count\\)](green)";
        renamed = "󰖷 ";
        deleted = " ";
      };

    };
  };
}
