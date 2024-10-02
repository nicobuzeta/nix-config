{ config, pkgs, ... }:

let
  user = config.username;
in
{
  imports = [ ../shared/home-manager.nix ];
  home = {
    packages = pkgs.callPackage ./userPackages.nix { };
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "24.05";
    sessionVariables = {
      MOZ_DISABLE_RDD_SANDBOX = "1";
      LIBVA_DRIVER_NAME = "nvidia";
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
