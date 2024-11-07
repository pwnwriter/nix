{ pkgs, ... }:
with pkgs;
[

  (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
]
