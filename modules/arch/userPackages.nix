{ pkgs, ... }:

let
  shared-user-packages = import ../shared/userPackages.nix { inherit pkgs; };
  user-packages = with pkgs; [ zotero_7 ];
in
shared-user-packages ++ user-packages
