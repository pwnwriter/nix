{ config, ... }:
{
  programs.neovide = {
    enable = true;

    settings = {
      neovim-bin = "/etc/profiles/per-user/pwnwriter/bin/nvim";
    };
  };
}
