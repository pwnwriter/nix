{
  description = "pwnwriter's macos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { darwin, hm, ... }:
    {
      darwinConfigurations = {
        wood = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./modules/darwin.nix
            hm.darwinModules.home-manager
            {
              home-manager.users = {
                pwnwriter = import ./modules;
              };
              users.users.pwnwriter = {
                name = "pwnwriter";
                home = "/Users/pwnwriter";
              };
            }
          ];
        };
      };
    };
}
