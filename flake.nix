{
  description = "pwnwriter's macos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

  };

  outputs =
    {
      home-manager,
      darwin,
      catppuccin,
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
                  catppuccin.homeModules.catppuccin
                ];
              };
            }
          ];
        };
      };
    };
}
