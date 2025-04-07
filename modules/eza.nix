{ ... }:
{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
    extraOptions = [
      "-T"
      "-L"
      "1"
    ];
  };
}
