{ ... }: {
  imports = [
    ./clamav.nix
    ./fail2ban.nix
    ./logrotate.nix
    ./openssh.nix
    ./sysstat.nix
    ./usbguard.nix
  ];
}
