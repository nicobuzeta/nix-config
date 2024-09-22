{
  config,
  pkgs,
  lib,
  home-manager,
  inputs,
  ...
}:

let
  user = config.username;
in
{
  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.fish;
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      {
        home = {
          enableNixpkgsReleaseCheck = false;
          packages = pkgs.callPackage ./userPackages.nix { };
          stateVersion = "23.11";
          sessionPath = [ "/opt/homebrew/bin" ];
        };
        imports = [
          ./features/alacritty
          ./features/kitty
          ../shared/home-manager.nix
        ];

        # programs = { } // import ../shared/home-manager.nix { inherit config pkgs lib; };

        # Marked broken Oct 20, 2022 check later to remove this
        # https://github.com/nix-community/home-manager/issues/3344
        manual.manpages.enable = false;
      };
  };
}
