{
  description = "pwnwriter's unix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";


  };

  outputs = { nixpkgs, home-manager, disko, ... }: {
    nixosConfigurations.wolf = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        ./configuration.nix
        ./disk-config.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.wolf = {
            home.username = "wolf";
            home.homeDirectory = "/home/wolf";
            home.stateVersion = "23.11";

            programs.home-manager.enable = true;
            services.gpg-agent = {
              enable = true;
              pinentryFlavor = "tty";
            };

            imports = [
              ./modules
            ];
          };
        }
      ];
    };

    homeConfigurations.macos = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      modules = [
        ./modules
        ./scripts
        {
          home.username = "pwnwriter";
          home.stateVersion = "23.11";
          home.homeDirectory = "/Users/pwnwriter";
        }
      ];
    };

  };
}
