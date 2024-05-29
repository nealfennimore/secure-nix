{ ... }: {
  imports = [
    ./dns.nix
    ./firewall.nix
    ./nts.nix
  ];
}
