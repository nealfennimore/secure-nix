# Secure Baseline NixOS

This is an opinionated secure base config for your nixos system.

## Features

- Hardened [Kernel](./modules/boot.nix)
- Hardened Profile `<nixpkgs/nixos/modules/profiles/hardened.nix>`
- Hardened [OpenSSH](./modules/services/openssh.nix)
- Enabled [Antivirus (ClamAV)](./modules/services/clamav.nix)
- Enabled [AppArmor](./modules/security/apparmor.nix)
- Enabled [Auditing](./modules/security/audit.nix)
- Enabled [Fail2Ban](./modules/services/fail2ban.nix) (when SSH enabled)
- Enabled [Logrotate](./modules/services/logrotate.nix) (:warning: not configured)
- Enabled [PAM Passwd Requirements](./modules/security/pam/services/passwd.nix)
- Enabled [Sysstat](./modules/services/sysstat.nix)
- Enabled [USBGuard](./modules/services/usbguard.nix)
- Encrypted [DNS over TLS](./modules/networking/dns.nix) via Cloudflare
- Encrypted [Network Time Security (NTS)](./modules/networking/nts.nix) via Cloudflare and System76
- Installed [Chkrootkit](./modules/environment/default.nix) (:warning: not on PATH)
- Installed [AIDE](./modules/environment/default.nix) (:warning: not configured or on PATH)
- Installed [acct](./modules/environment/default.nix)

## System Requirements

Suggested 3GB of memory when using ClamAV, otherwise disable like so:

```nix
  services.clamav = {
    daemon.enable = false;
    updater.enable = false;
  };
```

## Usage

### Flake Import

```nix
{
  description = "Your Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    secure-nix = {
      url = "github:nealfennimore/secure-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, secure-nix }: {

    nixosConfigurations = {
      my_system = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = secure-nix.modules ++ [
            ./configuration.nix
        ];
      };
    };
  };
}

```
