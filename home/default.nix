{ config, lib, pkgs, ... }:
let
  user = config.h.username;
  root = config.sys.home-root;
in {
  users.users.${user} = {
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
    ./git
    ./lsd
    {
      h.alacritty.enable = lib.mkDefault true;
      h.fish.enable = lib.mkDefault true;
      h.lsd.enable = lib.mkDefault true;
      h.git.enable = lib.mkDefault true;
      h.tmux.enable = lib.mkDefault true;
    }
  ];

  home-manager.users.${config.h.username} = {
    programs = {
      nix-index = {
        enable = false;
      };
      fzf = {
        enable = true;
      };
    };

    home = {
      stateVersion = "24.05";
      sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        SHELL = "/run/current-system/sw/bin/fish";
      };
    };
  };
}
