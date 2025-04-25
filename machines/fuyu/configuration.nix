{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./openssh.nix
    ./gnome.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "fuyu";

  networking.networkmanager.enable = true;

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

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

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
      gcc
      zig
      wl-clipboard
      wofi
      obsidian

      grim
      slurp
      gh
      bc

      wf-recorder
      mpv
      libcava

      code-cursor
      google-chrome
      bottom
      cosmic-files
      catppuccin-gtk

      nsxiv
    ];
  };

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  system.stateVersion = "24.11"; # Did you read the comment?

}
