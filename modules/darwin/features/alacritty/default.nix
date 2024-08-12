{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = builtins.fromTOML ''
      [font.normal]
      family = "JetBrainsMono Nerd Font Mono"
      style = "Regular"
    '';
  };
}
