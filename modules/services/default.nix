{ ... }: {
  imports = [
    ./clamav.nix
    ./logrotate.nix
    ./usbguard.nix
    ./openssh.nix
    ./fail2ban.nix
  ];
}
