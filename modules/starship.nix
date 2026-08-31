{ lib, pkgs, theme, ... }:

let
  macos_prompt = {
    error_symbol = "[ ](red)";
    vimcmd_symbol = "[ ](green)";
    success_symbol = "[ ](rosewater)";
  };

  linux_prompt = {
    error_symbol = "[ ](red)";
    vimcmd_symbol = "[ ](green)";
    success_symbol = "[ ](rosewater)";
  };
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      scan_timeout = 10;

      # Rosé Pine palette from the active theme (see modules/theme.nix).
      # The style strings below use Catppuccin-style colour names, mapped
      # onto Rosé Pine roles here so they keep working across variants.
      palette = "rose_pine";
      palettes.rose_pine = {
        inherit (theme)
          love
          gold
          rose
          pine
          foam
          iris
          text
          base
          surface
          overlay
          muted
          subtle
          ;
        red = theme.love;
        green = theme.pine;
        rosewater = theme.rose;
        pink = theme.iris;
        maroon = theme.rose;
      };

      format = ''
        $directory$git_branch$git_status
        $character
      '';

      right_format = "$nix_shell";

      character = if pkgs.stdenv.isDarwin then macos_prompt else linux_prompt;

      directory = {
        style = "bold pink";
        truncation_length = 1;
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
        conflicted = "󱣮";
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

      nix_shell = {
        impure_msg = "impure";
        pure_msg = "pure";
        unknown_msg = "unknown";
        format = "[$symbol$state]($style)";
        symbol = " ";
      };
    };
  };

}
