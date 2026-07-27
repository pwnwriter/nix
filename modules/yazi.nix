{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  xdg.configFile."yazi/init.lua".text = ''
    require("session"):setup {
      sync_yanked = true,
    }
  '';

  catppuccin = {
    enable = true;
    accent = "maroon";
    flavor = "latte";
  };
}
