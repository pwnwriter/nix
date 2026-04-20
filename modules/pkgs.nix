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
    tree-sitter
    statix
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
  #   ++ (import ./fonts.nix { inherit pkgs; });

  development =
    with pkgs;
    [
      clang
      nixfmt
      stylua
    ]
    ++ (import ./rust.nix { inherit pkgs; })
    ++ (import ./lsp.nix { inherit pkgs; })
    ++ (import ./go.nix { inherit pkgs; })
    ++ (import ./zig.nix { inherit pkgs; })
    ++ (import ./fonts.nix { inherit pkgs; });
in
{
  home.packages = utils ++ development;

}
