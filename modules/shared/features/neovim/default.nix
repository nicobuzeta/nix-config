{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      fd
      ripgrep
      clang-tools
      nil
      nixfmt-rfc-style
    ];
    withRuby = true;
    withNodeJs = true;
    withPython3 = true;
    viAlias = true;
  };

  # xdg.configFile = {
  #   "nvim".source =
  #     config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/modules/shared/features/neovim/nvimConfig/nvim";
  # };
  xdg.configFile.nvim = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "/home/nicobuzeta/nix-config/modules/shared/features/neovim/nvimConfig/nvim";
  };
}
