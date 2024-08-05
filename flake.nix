{
  description = "Starter Configuration for MacOS and NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovimConfig.url ="path:./neovim";
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
  };
}
