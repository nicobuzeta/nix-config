{
  description = "Starter Configuration for MacOS and NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, darwin, home-manager, nixpkgs, ... } @inputs:
    {
      darwinConfigurations = {
        "Nicolass-MacBook-Air" = darwin.lib.darwinSystem {
          specialArgs = { inherit inputs; };
          modules = [
            home-manager.darwinModules.home-manager
            ./hosts/darwin
          ];
        };
      };

      homeConfigurations."nicobuzeta" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [
          ./modules/shared/home-manager.nix
          {
            home.username = "nicobuzeta";
            home.homeDirectory = "/home/nicobuzeta";
            stateVersion = "24.05";
          }
        ];
      };
    };
}
