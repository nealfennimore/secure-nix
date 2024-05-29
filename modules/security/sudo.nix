{ lib, ... }:
{
  security.sudo = {
    enable = lib.mkDefault true;
    wheelNeedsPassword = lib.mkDefault true;
    execWheelOnly = lib.mkDefault true;
  };
}
