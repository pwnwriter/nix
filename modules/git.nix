{ pkgs, ... }:
let
  name = "pwnwriter";
  email = "hi@pwnwriter.me";
in
{
  programs.git = {
    enable = true;
    userName = name;
    userEmail = email;
    ignores = [ ".DS_Store" ];

    extraConfig = {
      pull.rebase = true;
      credential.helper = if pkgs.stdenv.isDarwin then "osxkeychain" else "cache";
      help.autocorrect = 10;
    };

    signing = {
      key = "A52411EC5582DE3A";
      signByDefault = pkgs.stdenv.isDarwin; # enable gpg signing on darwin only
    };

    aliases = {
      cl = "clone --depth=1 --filter=blob:none";
    };
  };
}
