{ lib, config, ... }:
{
  services.fail2ban = {
    enable = lib.mkDefault config.services.openssh.enable;
  };
}
