{ lib, pkgs, ... }: {
  users.users.root.hashedPassword = "$6$sNmLp6IctTDGiYls$TqTGMGvtbiwSPUyTNFaKirKD9G2BF1/hNgTx7DLt11qSrM/PLYzO6CdKL3PKW9F5ygfW549aQ0xP5TZQSvi2H/";

  services.openssh.enable = true;

  environment.systemPackages = lib.mkAfter (with pkgs;
    [ lynis ]);

  environment.sessionVariables = {
    PATH = "${pkgs.chkrootkit.out}/bin:${pkgs.aide.out}/bin";
  };

  boot.blacklistedKernelModules = [
    "dccp"
    "sctp"
    "rds"
    "tipc"
  ];
}
