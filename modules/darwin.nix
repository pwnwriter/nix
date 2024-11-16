{ ... }:

{
  system.stateVersion = 5;

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  networking.computerName = "earlymoon";

  nix.settings.trusted-users = [ "pwnwriter" ];

  programs.zsh.enable = true;

  system.defaults = {
    dock = {
      tilesize = 20;
      orientation = "left";
      autohide = true;
    };

    CustomUserPreferences."com.apple.screencapture" = {
      location = "~/Documents/screenshots";
      type = "png";
    };

    NSGlobalDomain = {
      _HIHideMenuBar = true;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
    };

    SoftwareUpdate = {
      AutomaticallyInstallMacOSUpdates = false;
    };

    trackpad = {
      Clicking = true;
    };

    loginwindow.LoginwindowText = "Have you been pwned?";
  };
}
