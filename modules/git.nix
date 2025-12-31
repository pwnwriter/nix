{ pkgs, ... }:
let
  name = "pwnwriter";
  email = "hi@pwnwriter.me";
in
{
  programs.git = {
    enable = true;

    ignores = [ ".DS_Store" ];

    # old: userName/userEmail/extraConfig/aliases -> settings.*
    settings = {
      user = {
        name = name;
        email = email;
      };

      pull.rebase = true;

      credential.helper = if pkgs.stdenv.isDarwin then "osxkeychain" else "cache";

      help.autocorrect = 10;

      alias = {
        cl = "clone --depth=1 --filter=blob:none";
      };
    };

    signing = {
      key = "A52411EC5582DE3A";
      signByDefault = pkgs.stdenv.isDarwin; # enable gpg signing on darwin only
    };
  };
}
