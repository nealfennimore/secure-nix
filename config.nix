{ lib, ... }:
{
  options = {
    _test = lib.mkOption {
      type = lib.types.bool;
      description = "Test";
      default = true;
    };
  };
}
