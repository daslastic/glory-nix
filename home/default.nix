{ config, lib, pkgs, ... }:
let
  user = config.home.username;
  root = config.sys.home-root;
in {
  imports = [
    ./home-manager.nix
  ];

  users.users.${user} = {
    shell = pkgs.fish;
    name = "${user}";
    home = "/${root}/${user}";
  };

  home-manager.users.${user} = { pkgs, ... }: {
    imports = [
      ./git
      ./alacritty
      ./fish
      ./lsd
      {
        h.git.enable = lib.mkDefault true;
        h.alacritty.enable = lib.mkDefault true;
        h.fish.enable = lib.mkDefault true;
        h.lsd.enable = lib.mkDefault true;
      }
    ];

    programs = {
      nix-index = {
        enable = false;
      };
    };

    home = {
      stateVersion = "24.05";
    };
  };
}
