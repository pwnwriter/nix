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
    catppuccin.homeModules.catppuccin
    ./../modules
    ./../modules/tmux.nix

    {
      home.username = "pwn";
      home.homeDirectory = "/home/pwn";
      home.stateVersion = "26.05";
    }
  ];
}
