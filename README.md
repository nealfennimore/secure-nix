# Secure Baseline NixOS

This is an opinionated secure base config for your nixos system.

## Features

- Hardened [Kernel](./modules/boot.nix)
- Hardened Profile `<nixpkgs/nixos/modules/profiles/hardened.nix>`
- Enabled [Auditing](./modules/security/audit.nix)
- Enabled [AppArmor](./modules/security/apparmor.nix)
- Enabled [Antivirus (ClamAV)](./modules/services/clamav.nix)
- Enabled [Logrotate](./modules/services/logrotate.nix)
- Enabled [USBGuard](./modules/services/usbguard.nix)
- Encrypted [DNS over TLS](./modules/networking/dns.nix) via Cloudflare
- Encrypted [Network Time Security (NTS)](./modules/networking/nts.nix) via Cloudflare and System76

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
        modules =secure-nix.modules ++ [
            ./configuration.nix
        ];
      };
    };
  };
}

```
