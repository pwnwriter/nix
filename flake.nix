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
            ./machines/earlymoon
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
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

      nixosConfigurations.fuyu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/fuyu/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.pwn = {
              imports = [
                ./modules
                ./scripts
                ./machines/fuyu
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
}
