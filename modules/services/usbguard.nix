{ lib, ... }:
{
  services.usbguard = {
    enable = lib.mkDefault true;
  };
}
