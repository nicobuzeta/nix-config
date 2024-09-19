{ pkgs, ... }:

with pkgs;
[
  gdb
  rr
  nixfmt-rfc-style
  clang-tools
  telegram-desktop
  pypy3
  act
  mosh
  dig
]
