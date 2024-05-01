{ config, pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      dash

      ## INFO
      onefetch
      neofetch
      btop
      htop

      ## UTIL
      tree
      vimv

      ## SUPER IMPORTANT
      sl
    ];

    shells = [ pkgs.dash ];
    loginShell = pkgs.dash;

    variables = {
      SHELL = "${pkgs.dash}/bin/dash";
    };
  };

  home-manager.users.${config.h.username} = {
    home.shellAliases = {
      vim = "nvim";
      tree = "tree -C";
    };
  };
}
