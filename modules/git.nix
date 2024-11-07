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
    };

    signing = {
      key = "A52411EC5582DE3A";
      signByDefault = pkgs.stdenv.isDarwin; # enable gpg signing on darwin only
    };

    aliases = {
      lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
    };
  };
}
