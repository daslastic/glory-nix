{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      # editor
      neovim
      ripgrep
      vimv

      # languages
      nodePackages.npm
      nodejs
      go

      # lsp used in nvim
      nil
    ];
  };

  home-manager.users.${config.h.username} = {
    xdg = {
      configFile = {
        "npm/config".text = ''
          cache=${config.h.cacheHome}/npm
        '';
      };
    };

    home = {
      sessionVariables = {
        GOPATH = "${config.h.dataHome}/go";
        NPM_CONFIG_PREFIX = "${config.h.dataHome}/npm";
        NPM_CONFIG_USERCONFIG = "${config.h.configHome}/npm/config";
      };

      sessionPath = [
        "${config.h.dataHome}/npm/bin"
      ];
    };
  };
}
