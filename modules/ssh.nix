{ config, pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        userKnownHostsFile = "${config.xdg.dataHome}/ssh/known_hosts";
        identityFile = "${config.xdg.dataHome}/ssh/id_rsa";

        extraOptions =
          if pkgs.stdenv.isDarwin then
            {
              AddKeysToAgent = "yes";
              UseKeychain = "yes";
            }
          else
            {
              AddKeysToAgent = "yes";
            };
      };

      "fawn" = {
        user = "fawn";
        hostname = "fawn.pwnwriter.xyz";
      };

      "dom" = {
        user = "pwn";
        hostname = "192.168.1.213";
      };
    };
  };
}
