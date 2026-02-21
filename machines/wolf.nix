{ inputs }:
let
  inherit (inputs) nixpkgs home-manager stylix;

  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  modules = [
    ./../modules
    stylix.nixosModules.stylix

    {
      home.username = "pwn";
      home.homeDirectory = "/home/pwn";
      home.stateVersion = "24.05";
    }
  ];
}
