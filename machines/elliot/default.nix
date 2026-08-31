{ inputs }:
let
  inherit (inputs)
    nixpkgs
    home-manager
    agenix
    ;

  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  modules = [
    agenix.homeManagerModules.default
    ./../../modules

    {
      home = {
        username = "eipi";
        homeDirectory = "/home/eipi";
        stateVersion = "26.05";
      };
    }
  ];
}
