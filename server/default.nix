{ modulesPath, lib, pkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];
  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  services.openssh.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
    pkgs.neovim
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQC72yKwsLmRhBZ57MzQIiRn2WS3rFZXBTfYIzG1fMVy8gU9z2VK7ZYVg+hVqM86Dz3taGH+P3yDCgJHMuPrI2R1EN2N8enhfnZprDZ+14IXbzpqCoAWsLF+mx3ZN+5SU5x0o9ODGXy6wLFIoCikfRxjEmfStLlumzO/tyc+GLsI8w== hey@pwnwriter.xyz"
  ];

  system.stateVersion = "23.11";

programs.zsh.enable = true;

users.users.wolf = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "User space for";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "storage" "docker"];
    packages = with pkgs; [ ];
  };

virtualisation.docker.enable = true;

virtualisation.docker.rootless = {
   enable = true;
   setSocketVariable = true;
};
}
