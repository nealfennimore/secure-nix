{ ... }: {
  imports = [
    ./environment
    ./networking
    ./security
    ./services
    ./systemd
    ./boot.nix
  ];

  system.stateVersion = "24.11";
}
