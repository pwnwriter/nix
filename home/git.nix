{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "pwnwriter";
    userEmail = "hey@pwnwriter.xyz";
  };
}

