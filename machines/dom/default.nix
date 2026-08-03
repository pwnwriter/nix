{ inputs }:
let
  inherit (inputs)
    nixpkgs
    home-manager
    catppuccin
    agenix
    determinate
    ;
in
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";

  modules = [
    { nixpkgs.config.allowUnfree = true; }

    determinate.nixosModules.default
    { determinate.enable = true; }

    ./hardware.nix
    ./system.nix
    ./nix.nix
    ./power.nix
    ./services.nix

    # --- home-manager integration --------------------------------
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;

        users.pwn = {
          imports = [
            ./../../modules
            catppuccin.homeModules.catppuccin
            agenix.homeManagerModules.default
          ];

          home.stateVersion = "26.05";
        };
      };
    }
  ];
}
