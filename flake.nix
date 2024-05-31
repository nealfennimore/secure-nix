{
  description = "Secure base nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-generators }: rec {

    modules = [
      "${nixpkgs}/nixos/modules/profiles/hardened.nix"
      ./modules/default.nix
    ];

    nixosConfigurations = {
      secure = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-generators.nixosModules.all-formats
          ./config.nix
        ] ++ modules;
      };
    };
  };
}
