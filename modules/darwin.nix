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
      InitialKeyRepeat = 10;
      KeyRepeat = 1;
    };

    screencapture = {
      location = "~/Documents/screenshots";
      type = "png";
    };

    trackpad = {
      Clicking = true;
    };

   loginwindow.LoginwindowText = "Have you been pwned?";
  };
}
