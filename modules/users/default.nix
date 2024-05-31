{ lib, config, ... }:
lib.mkIf (config._test or false) {
  users.users.root.hashedPassword = "$6$sNmLp6IctTDGiYls$TqTGMGvtbiwSPUyTNFaKirKD9G2BF1/hNgTx7DLt11qSrM/PLYzO6CdKL3PKW9F5ygfW549aQ0xP5TZQSvi2H/";
}
