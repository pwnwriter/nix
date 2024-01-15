{
  description = "PwnWriter's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      UserName = "pwn";
      HostName = "writer";
    in
    {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs UserName HostName; };
        modules = [
          ./laptop/init.nix
          home-manager.nixosModules.home-manager
          (config: {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${UserName} = config.users.${UserName} or import ./laptop/home.nix;
          })
        ];
      };
    };
}
