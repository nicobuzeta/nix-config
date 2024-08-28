{ pkgs, ... }:

let
  shared-system-packages = import ../shared/systemPackages.nix { inherit pkgs; };
  system-packages = with pkgs; [ ];
in
shared-system-packages ++ system-packages
