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
  ];

  darwin =
    with pkgs;
    with pkgs.darwin.apple_sdk;
    [
      wezterm

      frameworks.Security
      frameworks.CoreFoundation
    ]

    ++ (import ./fonts.nix { pkgs = pkgs; });

  development =
    with pkgs;
    [
      clang
      stylua
      nixfmt-rfc-style
    ]
    ++ (import ./rust.nix { pkgs = pkgs; })
    ++ (import ./lsp.nix { pkgs = pkgs; });
in
{
  home.packages = utils ++ development ++ darwin;

}
