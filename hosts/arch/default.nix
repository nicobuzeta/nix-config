{ config, pkgs, ... }:

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

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Setup user, packages, programs
  nix = {
    package = pkgs.nix;
    settings.trusted-users = [
      "@admin"
      "${user}"
    ];

    gc = {
      user = "root";
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 2;
        Minute = 0;
      };
      options = "--delete-older-than 30d";
    };

    # Turn this on to make command line easier
    settings.experimental-features = "nix-command flakes";
  };

  # Turn off NIX_PATH warnings now that we're using flakes
  system.checks.verifyNixPath = false;

  # Load configuration that is shared across systems
  environment.systemPackages =
    with pkgs;
    [ teams ] ++ (import ../../modules/shared/systemPackages.nix { inherit pkgs; });
}
