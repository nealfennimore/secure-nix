{ lib, ... }:
{
  services.logrotate = {
    enable = lib.mkDefault true;
  };
}
