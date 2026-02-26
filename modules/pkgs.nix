{ pkgs, ... }:
let
  utils = with pkgs; [
    aria2
    bat
    bottom
    claude-code
    curlie
    eza
    fastfetch
    fd
    gemini-cli-bin
    jnv
    jq
    just
    neovim
    openssl
    pkg-config
    ripgrep
    tmux
    typst
    uv
    zoxide
  ];

  # darwin =
  #   with pkgs.darwin.apple_sdk;
  #   [
  #
  #     frameworks.Security
  #     frameworks.CoreFoundation
  #     frameworks.SystemConfiguration
  #   ]
  #
  #   ++ (import ./fonts.nix { pkgs = pkgs; });

  development =
    with pkgs;
    [
      clang
      nixfmt
      stylua
    ]
    ++ (import ./rust.nix { pkgs = pkgs; })
    ++ (import ./lsp.nix { pkgs = pkgs; })
    ++ (import ./go.nix { pkgs = pkgs; })
    ++ (import ./zig.nix { pkgs = pkgs; })
    ++ (import ./fonts.nix { pkgs = pkgs; });
in
{
  home.packages = utils ++ development;

}
