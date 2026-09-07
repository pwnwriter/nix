{ inputs }:
(import ../../lib { inherit inputs; }).mkDarwin {
  modules = [
    # Mac Mini specific settings
    {
      system.keyboard.enableKeyMapping = true;
      system.keyboard.swapLeftCommandAndLeftAlt = true;
    }
  ];
}
