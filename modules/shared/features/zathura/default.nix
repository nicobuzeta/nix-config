{ pkgs, ... }:
let
  zathuraMupdf = (pkgs.zathuraPkgs.override { useMupdf = true; });
in
{
  programs.zathura = {
    enable = true;
    package = zathuraMupdf.zathuraWrapper;
  };
}
