{ config, ... }:
{
  programs.ssh = {
    enable = true;
    userKnownHostsFile = "${config.xdg.dataHome}/ssh/known_hosts";
    matchBlocks = {
      "*" = {
        identityFile = "${config.xdg.dataHome}/ssh/id_rsa";
        extraOptions = {
          AddKeysToAgent = "yes";
        };
      };
      "Host wolf.pwnwriter.xyz" = {
        user = "wolf";
        hostname = "wolf.pwnwriter.xyz";
      };
    };
  };
}
