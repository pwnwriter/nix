{ pkgs, ... }:
let
  name = "pwnwriter";
  email = "hi@pwnwriter.me";
  inherit (pkgs.lib) optionalAttrs;
in
{
  programs.git = {
    enable = true;
    userName = name;
    userEmail = email;
    ignores = [ ".DS_Store" ];

    extraConfig =
      {
        pull.rebase = true;
      }
      // optionalAttrs pkgs.stdenv.isDarwin {
        credential.helper = "osxkeychain";
      };

    signing = {
      key = "A52411EC5582DE3A";
      signByDefault = pkgs.stdenv.isDarwin;
    };

    aliases = {
      cl = "clone --depth=1 --filter=blob:none";
    };
  };
}
