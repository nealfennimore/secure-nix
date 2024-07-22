{ ... }: {
  imports = [
    ./clamav.nix
    ./fail2ban.nix
    ./logrotate.nix
    ./openssh.nix
    ./systat.nix
    ./usbguard.nix
  ];
}
