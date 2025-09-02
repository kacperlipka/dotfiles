{
  description = "Multi-host nix-darwin + NixOS + home-manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }: {
    darwinConfigurations = {
      "MacBook" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/macbook.nix
          home-manager.darwinModules.home-manager
        ];
      };
    };

    nixosConfigurations = {
      "ubuntu" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/ubuntu.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}

