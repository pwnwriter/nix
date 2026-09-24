{
  lib,
  pkgs,
  theme,
  ...
}:
{
  # Pull in the shared palette so GNOME's light/dark choice follows
  # `variant` in modules/theme.nix (summer -> light, winter -> dark).
  imports = [ ../../modules/theme.nix ];

  # GNOME (Wayland-only since GNOME 49), GDM as the greeter.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Straight into pwn's session on boot: the screen is a 24/7 dashboard, so
  # there is nobody at the greeter to log in.
  services.displayManager.autoLogin = {
    enable = true;
    user = "pwn";
  };
  # GDM autologin races getty on tty1 (NixOS/nixpkgs#103746).
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

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

        # Screen on 24/7: never blank, dim, lock, or suspend from the session.
        "org/gnome/desktop/session".idle-delay = lib.gvariant.mkUint32 0;
        "org/gnome/desktop/screensaver" = {
          lock-enabled = false;
          idle-activation-enabled = false;
        };
        "org/gnome/desktop/lockdown".disable-lock-screen = true;
        "org/gnome/settings-daemon/plugins/power" = {
          idle-dim = false;
          sleep-inactive-ac-type = "nothing";
          sleep-inactive-battery-type = "nothing";
          power-button-action = "interactive";
        };
      };
    }
  ];

  # Dashboard: a fullscreen Ghostty running btm, started with the GNOME
  # session and restarted if it ever exits (e.g. `q` in btm).
  # gtk-single-instance is off for this window so the process stays alive
  # as long as btm does; user-launched Ghostty windows are unaffected.
  systemd.user.services.btm-dashboard = {
    description = "Ghostty + btm system monitor";
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = lib.concatStringsSep " " [
        (lib.getExe pkgs.ghostty)
        "--gtk-single-instance=false"
        "--fullscreen=true"
        "-e"
        (lib.getExe pkgs.bottom)
      ];
      Restart = "always";
      RestartSec = 2;
    };
  };
}
