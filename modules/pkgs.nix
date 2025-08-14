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
    bottom
    curlie

    fastfetch
    neovim
    fd
    tmux
    uv
    typst

    openssl
    pkg-config
  ];

  darwin =
    with pkgs.darwin.apple_sdk;
    [

      frameworks.Security
      frameworks.CoreFoundation
      frameworks.SystemConfiguration
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
    ++ (import ./lsp.nix { pkgs = pkgs; })
    ++ (import ./go.nix { pkgs = pkgs; })
    ++ (import ./zig.nix { pkgs = pkgs; });
in
{
  home.packages = utils ++ development ++ darwin;

}
