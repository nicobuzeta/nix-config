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
      lazygit
      prettierd
      ueberzugpp
      imagemagick
    ];
    extraPython3Packages =
      ps: with ps; [
        pynvim
        jupyter_client
      ];
    extraLuaPackages = ps: with ps; [ magick ];
    withRuby = true;
    withNodeJs = true;
    withPython3 = true;
    viAlias = true;
    defaultEditor = true;
  };

  # xdg.configFile = {
  #   "nvim".source =
  #     config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/modules/shared/features/neovim/nvimConfig/nvim";
  # };
  xdg.configFile.nvim = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/modules/shared/features/neovim/nvim";
  };
}
