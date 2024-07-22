{ lib, ... }:
{
  networking = {
    dhcpcd.extraConfig = lib.mkDefault "nohook resolv.conf"; # Prevent DHCP from overwriting nameservers
    networkmanager = {
      enable = lib.mkDefault true;
      dns = lib.mkForce "none";
    };
    nameservers = lib.mkDefault [
      "1.1.1.1#cloudflare-dns.com"
      "2606:4700:4700::1111#cloudflare-dns.com"
    ];
  };

  services.resolved = {
    enable = lib.mkDefault true;
    dnssec = lib.mkDefault "allow-downgrade";
    llmnr = lib.mkDefault "false";
    dnsovertls = lib.mkDefault "opportunistic";
    fallbackDns = lib.mkDefault [
      "1.0.0.1#cloudflare-dns.com"
      "2606:4700:4700::1001#cloudflare-dns.com"
    ];
    # DNSStubListenerExtra=[::1]:53 allows `dig -6` to work
    extraConfig = lib.mkDefault ''
      Cache=yes
      DNSStubListenerExtra=[::1]:53
    '';
  };
}

