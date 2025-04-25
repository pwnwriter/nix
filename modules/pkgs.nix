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
    curlie

    fastfetch
    neovim
    fd
    tmux
    uv

    openssl
    pkg-config

  ];

  darwin = with pkgs.darwin.apple_sdk; [

    frameworks.Security
    frameworks.CoreFoundation
    frameworks.SystemConfiguration
  ];

  development =
    with pkgs;
    [
      clang
      stylua
      nixfmt-rfc-style
      ghostty
    ]
    ++ (import ./rust.nix { pkgs = pkgs; })
    ++ (import ./lsp.nix { pkgs = pkgs; })
    ++ (import ./go.nix { pkgs = pkgs; })
    ++ (import ./zig.nix { pkgs = pkgs; })
    ++ (import ./fonts.nix { pkgs = pkgs; });
in
{
  # No packages for if the system isn't darwin
  home.packages = utils ++ development ++ (if pkgs.stdenv.isDarwin then darwin else [ ]);

  fonts.fontconfig.enable = true;
}
