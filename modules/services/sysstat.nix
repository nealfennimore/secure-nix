{ lib, ... }:
{
  services.sysstat = {
    enable = lib.mkDefault true;
  };
}
