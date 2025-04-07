{
  description = "pwnwriter's nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      catppuccin,
      darwin,
      ...
    }:
    {
      darwinConfigurations = {
        earlymoon = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./modules/darwin.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useUserPackages = true;
              home-manager.users.pwnwriter = {
                imports = [
                  ./modules
                  ./scripts
                  catppuccin.homeManagerModules.catppuccin
                ];
              };
            }
          ];
        };
      };

      nixosConfigurations.nyx = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/nyx/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.pwn = {
              home.stateVersion = "25.05";
              programs.home-manager.enable = true;
              imports = [
                ./modules
                catppuccin.homeModules.catppuccin
              ];

            };
          }
        ];
      };
    };
}
