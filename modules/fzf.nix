{ ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
  };
}
