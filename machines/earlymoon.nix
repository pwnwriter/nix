{ inputs }:
let
  inherit (inputs)
    darwin
    home-manager
    catppuccin
    ;
in
darwin.lib.darwinSystem {
  system = "aarch64-darwin";

  modules = [
    ./../modules/darwin.nix
    home-manager.darwinModules.home-manager

    {
      home-manager.useUserPackages = true;

      home-manager.users.pwnwriter = {
        imports = [
          ./../modules
          catppuccin.homeModules.catppuccin
        ];
      };
    }
  ];
}
