{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
  };
}
