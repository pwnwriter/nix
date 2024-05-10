{ pkgs, ... }: {

  programs.git = {
    enable = true;
    userName = "pwnwriter";
    userEmail = "hey@pwnwriter.xyz";

    aliases = {
      lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
    };
  };


}
