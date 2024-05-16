{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      # editor
      neovim
      zola
      ripgrep

      # languages
      nodePackages.npm
      nodejs
      go

      # nix lsp used in nvim
      nil
      # apple
      xcodes
    ];
  };

  home-manager.users.${config.h.username} = {
    xdg = {
      configFile = {
        # I love npm
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
        CARGO_HOME = "${config.h.dataHome}/cargo";
      };

      sessionPath = [
        "${config.h.dataHome}/npm/bin"
      ];
    };
  };
}
