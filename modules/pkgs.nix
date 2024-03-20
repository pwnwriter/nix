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

    neovim

    jq
    aria2
    htop
    neofetch

  ];

#  darwin = with pkgs; [
#    wezterm
#    pass
#
#    darwin.apple_sdk.frameworks.Security
#    darwin.apple_sdk.frameworks.CoreFoundation
#    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
#  ];

#  server = with pkgs; [
#    yazi
#    presenterm
#  ];

  development = with pkgs; [
    gcc
    go
    trunk
    rustup

    zig
    zls

    stylua
    nixpkgs-fmt
    nil
    lua-language-server
    mdbook
    gopls
    lazygit



    wezterm
    pass

    darwin.apple_sdk.frameworks.Security
    darwin.apple_sdk.frameworks.CoreFoundation
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
in
{
  home.packages =
    core
    ++ development;
    #++ darwin;
    #++ server;
  #(
  #  if pkgs.stdenv.hostPlatform.isDarwin
  #  then darwin
  #  else server
  #);
}
