{ pkgs, ... }:
let
  import' = f: import f { inherit pkgs; };
in
{
  home.packages =
    (import' ./cli.nix)
    ++ (import' ./coding.nix)
    ++ (import' ./dev.nix)
    ++ (import' ./rust.nix)
    ++ (import' ./lsp.nix)
    ++ (import' ./go.nix)
    ++ (import' ./zig.nix)
    ++ (import' ./fonts.nix);
}
