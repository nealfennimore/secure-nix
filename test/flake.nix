{
  description = "Your Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    secure-nix = {
      url = "github:nealfennimore/secure-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, secure-nix, nixos-generators }: {

    nixosConfigurations = {
      secure = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = secure-nix.modules ++ [
          nixos-generators.nixosModules.all-formats
          ./configuration.nix
        ];
      };
    };
  };
}
