{ ... }: {
  imports = [
    ./environment
    ./networking
    ./security
    ./services
    ./systemd
    ./users
    ./boot.nix
  ];

  system.stateVersion = "24.11";
}
