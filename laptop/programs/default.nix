{ config, ... }:

{
  imports = [ 
  ./git.nix 
  ./zsh.nix 
  ./starship.nix 
  ./zoxide.nix
  ./bat.nix
  ./tmux.nix
  ./dedicated.nix
  ];

}

