{ config, pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      dash

      ## INFO
      onefetch
      neofetch
      btop
      htop
      tree

      ## IMPORTANT UTILS
      neovim
      ripgrep
      vimv
      go

      ## SUPER IMPORTANT
      sl
    ];

    shells = [ pkgs.dash ];
    loginShell = pkgs.dash;

    variables = {
      SHELL = "/run/current-system/sw/bin/dash";
    };
  };

  home-manager.users.${config.h.username} = {
    home.shellAliases = {
      vim = "nvim";
      tree = "tree -C";
    };
  };
}
