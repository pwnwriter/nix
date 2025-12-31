{ inputs }:
let
  inherit (inputs) nixpkgs home-manager catppuccin;

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
    catppuccin.homeModules.catppuccin

    {
      home.username = "pwn";
      home.homeDirectory = "/home/pwn";
      home.stateVersion = "24.05";
    }
  ];
}
