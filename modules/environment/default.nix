{ lib, pkgs, ... }:
{
  environment.systemPackages = lib.mkOrder 1499 (with pkgs;[
    acct
    aide
    chkrootkit
  ]);
}
