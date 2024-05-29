{ lib, ... }:
{
  networking.firewall = {
    enable = lib.mkDefault true;
    logRefusedConnections = lib.mkDefault true;
    logRefusedPackets = lib.mkDefault true;
  };
}
