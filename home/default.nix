{ config, lib, ... }:
let
  user = config.home.username;
  root = config.sys.home-root;
in {
  imports = [
    ./home-manager.nix
  ];

  users.users.${user} = {
    name = "${user}";
    home = "/${root}/${user}";
  };

  home-manager.users.${user} = { pkgs, ... }: {
    imports = [
      ./git
      {
        home.git.enable = lib.mkDefault true;
      }
    ];

    programs = {
      nix-index = {
        enable = false;
      };
    };

    home = {
      packages = [];
      stateVersion = "24.05";
    };
  };
}
