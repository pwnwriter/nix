{ pkgs, ... }:
let
  clip = if pkgs.stdenv.isDarwin then "pbcopy" else "wl-copy";

  upnull = pkgs.writeShellScriptBin "upnull" ''
    file=$1
    if [ -z "$file" ]; then
      echo "Usage: $0 <filename>"
      exit 1
    fi

    upload_url="https://null.pwnwriter.xyz"

    response=$(${pkgs.curl}/bin/curl -s -F "file=@$file" -H "Authorization: $(${pkgs.pass}/bin/pass personal/null)" $upload_url)

    echo "$response" | ${clip}

    echo -e "$response\n is copied to clipboard."
  '';
in
{
  home.packages = [ upnull ];
}
