{
  description = "Starter Configuration for MacOS and NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixCats.url = "path:./nixCats";
  };

  outputs = { self, darwin, home-manager, nixpkgs, nixCats } @inputs:
    {
      darwinConfigurations = {
        "Nicolass-MacBook-Air" = darwin.lib.darwinSystem {
          specialArgs = inputs;
          modules = [
            home-manager.darwinModules.home-manager
            ./hosts/darwin
          ];
        };
      };
  };
}
