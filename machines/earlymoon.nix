{ inputs }:
let
  inherit (inputs)
    darwin
    home-manager
    catppuccin
    agenix
    ;
in
darwin.lib.darwinSystem {
  system = "aarch64-darwin";

  modules = [
    # allow unfree packages
    {
      nixpkgs.config.allowUnfree = true;
    }

    ./../modules/darwin.nix
    home-manager.darwinModules.home-manager

    {
      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;

        users.pwnwriter = {
          imports = [
            ./../modules
            catppuccin.homeModules.catppuccin
            agenix.homeManagerModules.default
          ];

          home.stateVersion = "26.05";
        };
      };
    }
  ];
}
