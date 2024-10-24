{ pkgs, ... }:
let
  utils = with pkgs; [
    just
    bat
    zoxide
    eza
    ripgrep

    jq
    jnv
    aria2
    htop

    fastfetch
    neovim
    neovide
  ];

  darwin =
    with pkgs;
    with pkgs.darwin.apple_sdk;
    [
      arc-browser
      wezterm
      raycast

      frameworks.Security
      frameworks.CoreFoundation

      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

  development =
    with pkgs;
    [
      clang
      stylua
      nixfmt-rfc-style

      nil
      lua-language-server
      bash-language-server
    ]
    ++ (import ./rust.nix { pkgs = pkgs; });
in
{
  home.packages = utils ++ development ++ darwin;

}
