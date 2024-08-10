{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_vi_key_bindings
    '';
    shellInit = ''
      set fish_greeting ""
    '';
    plugins = [
      {
            name = "z";
            src = pkgs.fetchFromGitHub {
              owner = "kidonng";
              repo = "nix.fish";
              rev = "ad57d970841ae4a24521b5b1a68121cf385ba71e";
              sha256 = "13x3bfif906nszf4mgsqxfshnjcn6qm4qw1gv7nw89wi4cdp9i8q";
            };

        

      }
    ];
  };
}
