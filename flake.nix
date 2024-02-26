{
  description = "pwnwriter's macos config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { darwin, home-manager, ... }: {
    darwinConfigurations.pwnwriter = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./darwin
        home-manager.darwinModules.home-manager
        {
          home-manager.users = {
            pwnwriter = import ./home;
          };
          users.users.pwnwriter = {
            name = "pwnwriter";
            home = "/Users/pwnwriter";
          };
        }
      ];
    };
  };
}
