{ lib, ... }:
{
  services.openssh = {
    enable = lib.mkDefault false;
    settings = {
      AllowAgentForwarding = lib.mkDefault "no";
      AllowTcpForwarding = lib.mkDefault "no";
      ClientAliveCountMax = lib.mkDefault 2;
      KbdInteractiveAuthentication = lib.mkDefault false;
      MaxAuthTries = lib.mkDefault 3;
      MaxSessions = lib.mkDefault 2;
      PasswordAuthentication = lib.mkDefault false;
      PermitRootLogin = lib.mkDefault "no";
      TcpKeepAlive = lib.mkDefault "no";
    };
  };
}
