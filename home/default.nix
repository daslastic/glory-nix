{ config, lib, pkgs, ... }:
{
  users.users.${config.h.username} = {
    name = "${config.h.username}";
    home = "/${config.sys.home-root}/${config.h.username}";
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
    ./npm
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

    xdg = {
      enable = true;
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
