{ pkgs, ... }:
let
  upst = pkgs.writeShellScriptBin "upst" ''
    file=$1
    if [ -z "$file" ]; then
      echo "Usages: $0 <filename>"
      exit 1
    fi
    ${pkgs.curl}/bin/curl -s -F "file=@$file" https://null.pwnwriter.xyz
  '';
in
{
  home.packages = [ upst ];
}
