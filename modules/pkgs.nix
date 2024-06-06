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

    fastfetch
    pass
    neovim

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
    clang
    stylua
    nixpkgs-fmt
    nil
    lua-language-server
  ];

  server = with pkgs; [
    yazi
    presenterm
    tmux
    bun

    nodePackages.bash-language-server
    nodejs_22
    pnpm
    nodePackages_latest.pnpm
    nodePackages_latest.typescript-language-server

    yarn
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
