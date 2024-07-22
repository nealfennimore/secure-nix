{ lib, pkgs, config, ... }:
{
  security.pam.services.passwd.rules.password.pwquality = {
    control = lib.mkDefault "required";
    modulePath = lib.mkDefault "${pkgs.libpwquality.lib}/lib/security/pam_pwquality.so";
    order = lib.mkDefault (config.security.pam.services.passwd.rules.password.unix.order - 10);
    settings = {
      retry = lib.mkDefault 3;
      minlen = lib.mkDefault 8;
      difok = lib.mkDefault 6;
      dcredit = lib.mkDefault (-1);
      ucredit = lib.mkDefault 1;
      ocredit = lib.mkDefault (-1);
      lcredit = lib.mkDefault 1;
      enforce_for_root = lib.mkDefault true;
    };
  };
}
