{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./features/home-manager
    ./features/neovim
    ./features/direnv
    ./features/zsh
    ./features/btop
    ./features/bash
    ./features/fish
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
