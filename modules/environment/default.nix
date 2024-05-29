{ lib, pkgs, ... }:
{
  environment.systemPackages = lib.mkDefault (with pkgs;[
    aide
    chkrootkit
  ]);
}
