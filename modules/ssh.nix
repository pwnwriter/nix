{ config, pkgs, ... }:

let
  inherit (pkgs.lib) optionalAttrs;
in
{
  programs.ssh = {
    enable = true;
    userKnownHostsFile = "${config.xdg.dataHome}/ssh/known_hosts";
    matchBlocks = {
      "*" = {
        identityFile = "${config.xdg.dataHome}/ssh/id_rsa";
        extraOptions =
          optionalAttrs pkgs.stdenv.isDarwin {
            AddKeysToAgent = "yes";
            UseKeychain = "yes";
          }
          // {
          };
      };
      "Host fawn" = {
        user = "fawn";
        hostname = "fawn.pwnwriter.xyz";
      };
    };
  };
}
