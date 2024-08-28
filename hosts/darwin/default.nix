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
    ../../modules/darwin/home-manager.nix
    ../../modules/shared
    ../../modules/shared/cachix
    ../../modules/darwin/homebrew.nix
    ../../modules/darwin/brews.nix
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

  nixpkgs.hostPlatform = "aarch64-darwin";

  # Turn off NIX_PATH warnings now that we're using flakes
  system.checks.verifyNixPath = false;

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  # programs.fish.enable = true;
  # environment.shells = with pkgs; [ fish ];

  # Load configuration that is shared across systems
  environment.systemPackages = import ../../modules/darwin/systemPackages.nix { inherit pkgs; };

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;
}
