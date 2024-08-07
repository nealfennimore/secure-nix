{ lib, ... }:
{
  security.loginDefs = {
    settings = {
      PASS_MAX_DAYS = lib.mkDefault 365;
      PASS_MIN_DAYS = lib.mkDefault 1;
      PASS_WARN_AGE = lib.mkDefault 30;
      SHA_CRYPT_MIN_ROUNDS = lib.mkDefault 10000;
    };
  };
}
