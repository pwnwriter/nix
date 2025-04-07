{ ... }:
{
  programs.bat = {
    enable = true;

    config = {
      pager = "less -FR";
    };

  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}
