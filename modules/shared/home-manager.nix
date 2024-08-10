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
    ./features/tmux
    ./features/alacritty
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
