{
  description = "Starter Configuration for MacOS and NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      darwin,
      home-manager,
      flake-utils,
      nixpkgs,
      ...
    }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      darwinConfigurations = {
        "Nicolass-MacBook-Air" = darwin.lib.darwinSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            home-manager.darwinModules.home-manager
            ./hosts/darwin
          ];
        };
      };

      packages = forAllSystems (system: {
        homeConfigurations."nicobuzeta" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {
            inherit inputs;
            inherit system;
          };
          modules = [
            ./modules/shared/home-manager.nix
            {
              home = {
                username = "nicobuzeta";
                homeDirectory = "/home/nicobuzeta";
                stateVersion = "24.05";
                sessionVariables = {
                  XDG_SESSION_TYPE = "wayland";
                  QT_QPA_PLATFORM = "wayland";
                  QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
                  XDG_CURRENT_DESKTOP = "sway";
                  XDG_SESSION_DESKTOP = "sway";
                  MOZ_ENABLE_WAYLAND = 1;
                  MOZ_USE_XINPUT2 = 1;
                };
              };
            }
          ];
        };
      });
    };
}
