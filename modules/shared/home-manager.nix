{ config, pkgs, lib, ... }:

{
  imports = [
    ./features/home-manager
    ./features/neovim
  ];
}
