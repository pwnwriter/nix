{ config, pkgs, ... }:
{
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        userKnownHostsFile = "${config.xdg.dataHome}/ssh/known_hosts";
        identityFile = "${config.xdg.dataHome}/ssh/id_rsa";

        extraOptions = {
          AddKeysToAgent = "yes";
          UseKeychain = if pkgs.stdenv.isDarwin then "yes" else "no";
        };
      };

      "fawn" = {
        user = "fawn";
        hostname = "fawn.pwnwriter.xyz";
      };
    };
  };
}
