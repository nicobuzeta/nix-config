{ pkgs, ... }:

let
  shared-user-packages = import ../shared/userPackages.nix { inherit pkgs; };
  user-packages = with pkgs; [
    zotero_7
    gdb
    rr
  ];
in
shared-user-packages ++ user-packages
