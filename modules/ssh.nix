{ config, pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    userKnownHostsFile = "${config.xdg.dataHome}/ssh/known_hosts";
    matchBlocks = {
      "*" = {
        identityFile = "${config.xdg.dataHome}/ssh/id_rsa";
        extraOptions = {
          AddKeysToAgent = "yes";
          UseKeychain = if pkgs.stdenv.isDarwin then "yes" else "no";
        };
      };
      "Host fawn" = {
        user = "fawn";
        hostname = "fawn.pwnwriter.xyz";
      };
    };
  };
}
