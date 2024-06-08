{ pkgs, ... }:
let
  name = "pwnwriter";
  email = "hey@pwnwriter.xyz";
in
{
  programs.git = {
    enable = true;
    userName = name;
    userEmail = email;
    ignores = [ ".DS_Store" ];

    extraConfig = {
      pull.rebase = true;
      credential.helper =
        if pkgs.stdenv.isDarwin
        then "osxkeychain"
        else "cache";
    };

    signing = {
      key = "B681763F9B5BDF279A139E0C0544A89BC51920AA";
      signByDefault = true;
    };

    aliases = {
      lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
    };
  };
}
