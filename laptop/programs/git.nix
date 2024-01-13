{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "pwnwriter";
    userEmail = "hey@pwnwriter.xyz";
    #  signing = {
    #  key = "${config.home.homeDirectory}/.ssh/id_rsa";
    #  signByDefault = true;
    #};
  };
}

