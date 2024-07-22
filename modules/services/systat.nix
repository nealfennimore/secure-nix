{ lib, ... }:
{
  services.systat = {
    enable = lib.mkDefault true;
  };
}
