{ pkgs }:

with pkgs;
let
  shared-user-packages = import ../shared/userPackages.nix { inherit pkgs; };
in
shared-user-packages ++ [ ]
