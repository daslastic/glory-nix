{ config, pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      ## INFO
      onefetch
      neofetch
      btop
      htop

      ## IMPORTANT
      ripgrep

      ## SUPER IMPORTANT
      sl
    ];
  };

  home-manager.users.${config.h.username} = {
    home.shellAliases = {
      clear = "sl";
      vim = "nvim";
    };
  };
}
