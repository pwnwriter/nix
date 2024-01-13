programs.zsh = {
  enable = true;
  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
  };
  histSize = 10000;
  histFile = "${config.xdg.dataHome}/zsh/history";
};

