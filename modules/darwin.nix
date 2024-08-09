{ ... }:

{
  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  networking.computerName = "earlymoon";

  system.defaults = {
    dock = {
      orientation = "left";
      autohide = true;
    };

    NSGlobalDomain = {
      _HIHideMenuBar = true;
      InitialKeyRepeat = 5;
      KeyRepeat = 5;
    };

    screencapture = {
      location = "~/Documents/screenshots";
      type = "png";
    };

    trackpad = {
      Clicking = true;
    };
  };
}
