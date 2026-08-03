{ pkgs, lib, ... }:
{
  config = lib.mkIf pkgs.stdenv.isLinux {
    home.packages = [ pkgs.herdr ];

    xdg.configFile."herdr/config.toml".text = ''
      [theme]
      name = "rose-pine"
      auto_switch = true
      dark_name = "rose-pine"
      light_name = "rose-pine-dawn"
    '';
  };
}
