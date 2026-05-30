{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "dom";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb.layout = "us";

  programs.zsh.enable = true;

  users.users.pwn = {
    isNormalUser = true;
    description = "pwn";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC93QOhzNoYLf4HFhGrqzUpvKMETibptGagxZTD73h5f3i2kPIebwZX3qtkVa84b4JCH419HzzCs1w8B9dH3rOPd+y2UHZB1oterJDPSp4lQcyV8jkS9gp49A16AQQf7SGFkgG/xKUxPulTKAc5CqMtLNz67TEyi61Q4t8ASO31xfOWdJyBnGaUcQyhckuZn5hMIQgKOqfFpgJosUENzR4F6Osml5SBuToNcCXlPQqx5cECCUDCtE7i+xQtv77Q5t2h5/UbJq2YKW0uBbc4ZMtwOBKYhyx4DYV9ecEPNTgjotaO37xUBQqFuIgEo6lfd151n7MkUBe5seJzwO8HeBsZ hi@pwnwriter.me"
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "25.11";
}
