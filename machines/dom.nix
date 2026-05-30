{ inputs }:
let
  inherit (inputs)
    nixpkgs
    home-manager
    catppuccin
    agenix
    ;
in
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";

  modules = [
    { nixpkgs.config.allowUnfree = true; }

    # --- hardware ------------------------------------------------
    {
      imports = [ (nixpkgs + "/nixos/modules/installer/scan/not-detected.nix") ];

      boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      boot.kernelModules = [ "kvm-intel" ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/e52a7deb-5052-4521-a7c8-0232ca1b41a0";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/86CA-0396";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

      nixpkgs.hostPlatform = "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = true;
    }

    # --- system --------------------------------------------------
    {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "dom";
      networking.networkmanager.enable = true;

      time.timeZone = "America/New_York";

      i18n.defaultLocale = "en_US.UTF-8";

      services.xserver.xkb.layout = "us";

      # user
      users.users.pwn = {
        isNormalUser = true;
        description = "pwn";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC93QOhzNoYLf4HFhGrqzUpvKMETibptGagxZTD73h5f3i2kPIebwZX3qtkVa84b4JCH419HzzCs1w8B9dH3rOPd+y2UHZB1oterJDPSp4lQcyV8jkS9gp49A16AQQf7SGFkgG/xKUxPulTKAc5CqMtLNz67TEyi61Q4t8ASO31xfOWdJyBnGaUcQyhckuZn5hMIQgKOqfFpgJosUENzR4F6Osml5SBuToNcCXlPQqx5cECCUDCtE7i+xQtv77Q5t2h5/UbJq2YKW0uBbc4ZMtwOBKYhyx4DYV9ecEPNTgjotaO37xUBQqFuIgEo6lfd151n7MkUBe5seJzwO8HeBsZ hi@pwnwriter.me"
        ];
      };

      security.sudo.wheelNeedsPassword = false;

      system.stateVersion = "25.11";
    }

    # --- nix settings --------------------------------------------
    {
      nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        trusted-users = [ "root" "pwn" ];
      };

      # auto garbage-collect old generations
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
      };

      # auto-upgrade from the flake (optional — remove if you prefer manual)
      # system.autoUpgrade = {
      #   enable = true;
      #   flake = "github:pwnwriter/nix#dom";
      #   dates = "04:00";
      # };
    }

    # --- server / laptop power -----------------------------------
    {
      # keep running with lid closed
      services.logind = {
        lidSwitch = "ignore";
        lidSwitchDocked = "ignore";
        lidSwitchExternalPower = "ignore";
      };

      # power management for thermals
      services.tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
          CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
          CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        };
      };

      # prevent suspend/hibernate
      systemd.targets = {
        sleep.enable = false;
        suspend.enable = false;
        hibernate.enable = false;
        hybrid-sleep.enable = false;
      };
    }

    # --- services ------------------------------------------------
    {
      # ssh
      services.openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "no";
          PasswordAuthentication = false;
        };
      };

      # tailscale
      services.tailscale.enable = true;

      # docker
      virtualisation.docker = {
        enable = true;
        autoPrune = {
          enable = true;
          dates = "weekly";
        };
      };

      # firewall — allow ssh + tailscale, block everything else
      networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 22 ];
        trustedInterfaces = [ "tailscale0" ];
      };
    }

    # --- home-manager integration --------------------------------
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;

        users.pwn = {
          imports = [
            ./../modules
            ./../modules/tmux.nix
            catppuccin.homeModules.catppuccin
            agenix.homeManagerModules.default
          ];

          home.stateVersion = "25.11";
        };
      };
    }
  ];
}
