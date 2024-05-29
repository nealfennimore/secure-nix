{ lib, ... }:
{
  services.chrony = {
    enable = lib.mkDefault true;
    enableNTS = lib.mkDefault true;
  };

  networking = {
    timeServers = lib.mkDefault [
      "time.cloudflare.com"
      "virginia.time.system76.com"
      "ohio.time.system76.com"
      "oregon.time.system76.com"
    ];
  };
}
