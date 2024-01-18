{lib, config, pkgs, inputs, ... }:

{
  imports = [ 
  ./git.nix 
  ./shell.nix 
  ./starship.nix 
  ./zoxide.nix
  ./tmux.nix
  ./dedicated.nix
  ];

}

