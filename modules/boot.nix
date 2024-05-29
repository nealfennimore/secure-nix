{ pkgs, lib, ... }:
{
  boot.kernelPackages = lib.mkOrder 1499 pkgs.linuxKernel.packages.linux_6_9_hardened;
}
