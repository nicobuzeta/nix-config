{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Mono";
    theme = "Adwaita dark";
  };
}
