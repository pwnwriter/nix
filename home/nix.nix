{ lib, pkgs, ... }: {

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true; # https://github.com/NixOS/nix/issues/7273
      warn-dirty = false;
    };
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 1w";
    };
  };
}
