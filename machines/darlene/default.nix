{ inputs }:
(import ../../lib { inherit inputs; }).mkDarwin {
  modules = [
    { services.tailscale.enable = true; }
    # Mac Mini specific settings
    {
      system.keyboard.enableKeyMapping = true;
      system.keyboard.swapLeftCommandAndLeftAlt = true;
    }
  ];
}
