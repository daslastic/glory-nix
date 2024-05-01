{ config, lib, pkgs, ... }:
{
  imports = [
    # VITAL
    ./home-config.nix
    ./global.nix
    ./dev
    ./fd

    ./fish
    ./alacritty
    ./tmux
    ./git
    ./lsd
    ./scripts
    {
      h.alacritty.enable = lib.mkDefault true;
      h.fish.enable = lib.mkDefault true;
      h.lsd.enable = lib.mkDefault true;
      h.git.enable = lib.mkDefault true;
      h.tmux.enable = lib.mkDefault true;
    }
  ];

  programs.direnv = {
    silent = true;
    enable = true;
  };

  users.users.${config.h.username} = {
    name = "${config.h.username}";
    home = "${config.h.homePath}";
  };

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
      configHome = "${config.h.configHome}";
      dataHome = "${config.h.dataHome}";
    };

    home = {
      stateVersion = "24.05";
      sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        SHELL = "${pkgs.fish}/bin/fish";
      };
    };
  };
}
