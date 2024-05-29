{ lib, ... }:
{
  security.apparmor = {
    enable = lib.mkDefault true;
  };
}
