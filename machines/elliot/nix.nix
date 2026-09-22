{ ... }:
{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
      "pwn"
    ];
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 14d";
    };
  };
}
