{
  description = "👻";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
  };

  outputs = inputs: {
    # macOS (nix-darwin)
    darwinConfigurations = {
      darlene = import ./machines/darlene.nix { inherit inputs; };
      whiterose = import ./machines/whiterose.nix { inherit inputs; };
    };

    # NixOS
    nixosConfigurations = {
      dom = import ./machines/dom.nix { inherit inputs; };
    };

    # home-manager (linux)
    homeConfigurations = {
      elliot = import ./machines/elliot.nix { inherit inputs; };
      fsoc = import ./machines/fsoc.nix { inherit inputs; };
    };
  };
}
