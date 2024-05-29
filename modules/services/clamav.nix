{ lib, ... }:
{
  services.clamav = {
    daemon.enable = lib.mkDefault true;
    updater.enable = lib.mkDefault true;
  };
}
