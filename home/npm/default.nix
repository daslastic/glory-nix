{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      nodePackages.npm
      nodejs
    ];
  };

  home-manager.users.${config.h.username} = {
    xdg = {
      configFile = {
        "npm/config".text = ''
          cache=/${config.sys.home-root}/${config.h.username}/.cache/npm
        '';
      };
    };
  };
}
