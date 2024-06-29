{ pkgs, ... }:
let
  upnull = pkgs.writeShellScriptBin "upnull" ''
    file=$1
    if [ -z "$file" ]; then
      echo "Usage: $0 <filename>"
      exit 1
    fi
    ${pkgs.curl}/bin/curl -s -F "file=@$file" -H "Authorization: $(${pkgs.pass}/bin/pass personal/null)" https://null.pwnwriter.xyz
  '';
in
{
  home.packages = [ upnull ];
}
