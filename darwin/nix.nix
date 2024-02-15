{ pkgs, ... }: {
  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = false; # https://github.com/NixOS/nix/issues/7273
    };
  };
}
