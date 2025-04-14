{ pkgs, ... }:
let
  wal = pkgs.writeShellScriptBin "wal" ''
    img=$(find ~/Pictures -type f | shuf -n 1)

    if [ -n "$img" ]; then
      swww img "$img" --transition-type random
    else
      echo "No images found in ~/Pictures."
      exit 1
    fi
  '';
in
{
  home.packages = [ wal ];
}
