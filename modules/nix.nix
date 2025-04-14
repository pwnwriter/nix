# let nix manage itself

{ lib, pkgs, ... }:
{
  nix.package = lib.mkForce pkgs.nixVersions.latest;
  nix.settings = {
    use-xdg-base-directories = true;
    experimental-features = "nix-command flakes";
  };

  nix.settings.trusted-users = [
    "root"
    "pwnwriter"
    "pwn"
  ];
}
