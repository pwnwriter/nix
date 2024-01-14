_default:
	@just -l

nix-clean:
	doas nix-collect-garbage -d

nix-rebuild: 
	doas nixos-rebuild switch --flake .#laptop

get-ip:
	@dig -4 TXT +short o-o.myaddr.l.gooole.com @ns1.google.com
