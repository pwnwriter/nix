{ pkgs, lib, ... }:
{
  config = lib.mkIf pkgs.stdenv.isLinux {
    home.packages = [ pkgs.herdr ];
  };
}
