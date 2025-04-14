{ pkgs, ... }:

let
  clip = "wl-copy";

  sst = pkgs.writeShellScriptBin "sst" ''
    outdir="$HOME/Pictures";
    mkdir -p "$outdir"
    clipboard="${clip}"

    generate_timestamp() {
      date +"%Y-%m-%d at %H.%M.%S"
    }

    no_selection() {
      filename="$outdir/Screen Shot $(generate_timestamp).png"
      grim "$filename"
      $clipboard "$filename"
    }

    selection() {
      filename="$outdir/Screen Shot $(generate_timestamp).png"
      grim -g "$(slurp)" "$filename"
      $clipboard "$filename"
    }

    if [ $# -eq 0 ]; then
      echo "Usage: $0 <no_selection|selection>"
      exit 1
    fi

    case "$1" in
      "no_selection" | "no-selection")
        no_selection
        ;;
      "selection")
        selection
        ;;
      *)
        echo "Invalid option. Usage: $0 <no_selection|selection>"
        exit 1
        ;;
    esac

    exit 0
  '';

in
{
  home.packages = [
    sst
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
  ];
}
