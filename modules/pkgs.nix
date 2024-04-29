{ pkgs, ... }:
let
  core = with pkgs; [
    tree
    just
    bat
    zoxide
    eza
    ripgrep
    fzf
    jq
    aria2
    htop
    neofetch
    pass
  ];

  darwin =
    with pkgs;
    with pkgs.darwin.apple_sdk;
    [
      wezterm
      frameworks.Security
      frameworks.CoreFoundation
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

  development = with pkgs; [
    gcc
    trunk
    rustup
    mdbook
    lazygit

    zig
    zls

    stylua
    nixpkgs-fmt
    nil
    lua-language-server
    gopls
    go
  ];

  server = with pkgs; [
    yazi
    presenterm
    tmux
    bun

    yarn
    nodejs_21
    docker-compose

  ];

in
{
  home.packages =
    core
    ++ development
    ++ (
      if pkgs.stdenv.isDarwin
      then darwin
      else server
    );

}
