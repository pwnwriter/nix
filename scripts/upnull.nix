{ pkgs, ... }:
let
  clip = if pkgs.stdenv.isDarwin then "pbcopy" else "wl-copy";

  upnull = pkgs.writeShellScriptBin "upnull" ''
    file=$1
    if [ -z "$file" ]; then
      echo "Usage: $0 <filename>"
      exit 1
    fi

    upload_url="https://0x0.st"

    response=$(${pkgs.curl}/bin/curl -s -F "file=@$file" $upload_url)

    echo "$response" | ${clip}

    echo -e "$response\n is copied to clipboard."
  '';
in
{
  home.packages = [ upnull ];
}
