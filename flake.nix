{
  description = "pwnwriter's unix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations = {
      macos = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [
          ./modules
          {
            home.username = "pwnwriter";
            home.stateVersion = "23.11";
            home.homeDirectory = "/Users/pwnwriter";
          }
        ];
      };

      server = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        modules = [
          ./modules
          {
            home.username = "wood";
            home.stateVersion = "23.11";
            home.homeDirectory = "/home/wood";
          }
        ];
      };

    };
  };
}
