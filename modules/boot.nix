{ pkgs, lib, ... }:
{
  boot.kernelPackages = lib.mkOrder 1499 pkgs.linuxKernel.packages.linux_6_9_hardened;
  boot.kernelModules = lib.mkDefault [ ];
  boot.initrd.includeDefaultModules = lib.mkDefault false;
  boot.initrd.kernelModules = lib.mkDefault [ ];
  boot.blacklistedKernelModules = lib.mkDefault [
    "dccp"
    "sctp"
    "rds"
    "tipc"
  ];
}
