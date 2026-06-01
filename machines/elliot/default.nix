{ inputs }:
let
  inherit (inputs) nixpkgs home-manager catppuccin agenix;

  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  modules = [
    catppuccin.homeModules.catppuccin
    agenix.homeManagerModules.default
    ./../../modules
    ./../../modules/tmux.nix

    {
      home = {
        username = "pwn";
        homeDirectory = "/home/pwn";
        stateVersion = "26.05";
      };
    }
  ];
}
