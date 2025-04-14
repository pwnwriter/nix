{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "fuyu"; # Define your hostname.
  programs.hyprland.enable = true;

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    python3
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.openssh.enable = true;

  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  # };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pwn = {
    isNormalUser = true;
    description = "pwn";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "storage"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      waybar
      gcc
      zig
      wl-clipboard
      wofi
      swww
      obsidian

      grim
      slurp
      papirus-icon-theme
      gh
      bc

      gnome-calculator
      gnome-calendar


      wf-recorder
      mpv
      brightnessctl
      libcava

      code-cursor
      google-chrome
      bottom
      swayimg
      cosmic-files
      catppuccin-gtk
    ];
  };

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  # environment.systemPackages = with pkgs; [
  # ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  system.stateVersion = "24.11"; # Did you read the comment?
}
