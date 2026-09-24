{ theme, ... }:
{
  # Pull in the shared palette so GNOME's light/dark choice follows
  # `variant` in modules/theme.nix (summer -> light, winter -> dark).
  imports = [ ../../modules/theme.nix ];

  # GNOME (Wayland-only since GNOME 49), GDM as the greeter.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # GNOME turns on power-profiles-daemon, which conflicts with the tlp setup
  # in power.nix. Keep tlp: it owns the AC/battery governor policy here.
  services.power-profiles-daemon.enable = false;

  # System-wide dconf defaults (user can still override in Settings).
  programs.dconf.profiles.user.databases = [
    {
      settings = {
        # Evergarden: light = Summer, dark = Winter. Ghostty follows this via
        # the desktop portal and swaps between its two generated themes.
        "org/gnome/desktop/interface" = {
          color-scheme = if theme.isDark then "prefer-dark" else "default";
          accent-color = "green"; # Evergarden's accent
        };

        # elliot is also a lid-closed server (see power.nix): never let the
        # desktop session suspend the machine on idle.
        "org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-ac-type = "nothing";
          sleep-inactive-battery-type = "nothing";
          power-button-action = "interactive";
        };
      };
    }
  ];
}
