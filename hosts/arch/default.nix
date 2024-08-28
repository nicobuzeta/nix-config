{ pkgs, ... }:

let
  user = "nicobuzeta";
in

{
  imports = [
    (
      { lib, ... }:
      {
        options.username = lib.mkOption {
          type = lib.types.str;
          default = user;
        };
      }
    )
    ../../modules/arch/home-manager.nix
    ../../modules/shared
    ../../modules/shared/cachix
  ];
  # Setup user, packages, programs
  nix = {
    package = pkgs.nix;

    # Turn this on to make command line easier
    settings.experimental-features = "nix-command flakes";
  };

  environment.systemPackages = import ../../modules/arch/systemPackages.nix { inherit pkgs; };
}
