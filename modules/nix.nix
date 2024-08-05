# let nix manage itself

{ pkgs, ... }:
{
  nix.package = pkgs.nixVersions.latest;
  nix.settings = {
    use-xdg-base-directories = true;
    build-users-group = "nixbld";
    experimental-features = "nix-command flakes";
    bash-prompt-prefix = "(nix:$name) ";
    max-jobs = "auto";
    extra-nix-path = "nixpkgs=flake:nixpkgs";
  };
}
