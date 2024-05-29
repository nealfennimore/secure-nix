{ ... }: {
  imports = [
    ./clamav.nix
    ./logrotate.nix
    ./usbguard.nix
  ];
}
