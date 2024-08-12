{ pkgs }:

with pkgs;
let shared-user-packages = import ../shared/packages.nix { inherit pkgs; }; in
shared-user-packages ++ [
]
