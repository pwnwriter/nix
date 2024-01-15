{lib, config, pkgs, inputs, ... }:

{
  imports = [ 
  ./git.nix 
  ./zsh.nix 
  ./starship.nix 
  ./zoxide.nix
  ./tmux.nix
  ./dedicated.nix
  ];

}

