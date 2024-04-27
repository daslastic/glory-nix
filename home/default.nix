{ config, lib, pkgs, ... }:
let
  user = config.h.username;
  root = config.sys.home-root;
in {
  users.users.${user} = {
    shell = pkgs.fish;
    name = "${user}";
    home = "/${root}/${user}";
  };

  imports = [
    # VITAL
    ./global.nix
    ./fd

    ./fish
    ./alacritty
    ./tmux
    ./fzf
    ./git
    ./lsd
    {
      h.alacritty.enable = lib.mkDefault true;
      h.fish.enable = lib.mkDefault true;
      h.lsd.enable = lib.mkDefault true;
      h.git.enable = lib.mkDefault true;
      h.tmux.enable = lib.mkDefault true;
      h.fzf.enable = lib.mkDefault true;
    }
  ];

  home-manager.users.${config.h.username} = {
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
