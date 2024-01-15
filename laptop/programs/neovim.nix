{ inputs
, pkgs
, ...
}: {
  programs.neovim =
    let
      neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
    in
    {
      enable = true;
      defaultEditor = true;
      package = neovim-nightly;
      # package = pkgs.neovim-unwrapped;

      vimAlias = true;
      viAlias = true;

      extraPackages = with pkgs; [
        ripgrep
      ];
    };
}
