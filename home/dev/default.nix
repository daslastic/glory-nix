{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      # editor
      tree-sitter
      zola
      ripgrep
      neovim

      # languages
      nodePackages_latest.npm
      nodejs
      go

      vscode-langservers-extracted
      nil
      rust-analyzer
      lua-language-server
      nodePackages_latest.typescript-language-server
      nodePackages_latest.live-server
      emmet-ls

      # lua
      luajit

      # make css format
      nodePackages_latest.prettier

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
