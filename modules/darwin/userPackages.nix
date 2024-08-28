{ pkgs, ... }:

let
  shared-user-packages = import ../shared/userPackages.nix { inherit pkgs; };
  user-packages = with pkgs; [ teams ];
in
shared-user-packages ++ user-packages
