{
  description = "PwnWriter's MacOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      arch = "aarch64-darwin";
    in
    {
      defaultPackage.${arch} =
        home-manager.defaultPackage.${arch};
      homeConfigurations.pwnwriter =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${arch};
          modules = [ ./home ];
        };
    };
}

