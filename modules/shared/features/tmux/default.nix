{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    prefix = "C-a";
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      tmuxPlugins.sensible
    ];
    extraConfig = ''
      bind b split-window -v
      bind v split-window -h
      unbind '"'
      unbind '%'
    '';
  };
}
