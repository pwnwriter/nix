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
  };

  outputs = inputs: {
    # macOS (nix-darwin)
    darwinConfigurations = {
      earlymoon = import ./machines/earlymoon.nix { inherit inputs; };
      phantom = import ./machines/phantom.nix { inherit inputs; };
    };

    # home-manager (pop-os)
    homeConfigurations = {
      wolf = import ./machines/wolf.nix { inherit inputs; };
    };
  };
}
