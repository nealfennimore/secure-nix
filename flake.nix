{
  description = "Secure base nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    modules = [
      "${nixpkgs}/nixos/modules/profiles/hardened.nix"
      ./modules/default.nix
    ];
  };
}
