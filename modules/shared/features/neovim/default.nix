{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      fd
      ripgrep
    ];
    viAlias = true;
  };

  # xdg.configFile = {
  #   "nvim".source =
  #     config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/modules/shared/features/neovim/nvimConfig/nvim";
  # };
  xdg.configFile.nvim = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "/Users/nicobuzeta/new-nix/modules/shared/features/neovim/nvimConfig/nvim";
  };
}
