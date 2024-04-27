{
  config,
  lib,
  pkgs,
  ...
}: {
  options.h = {
    alacritty.enable = lib.mkEnableOption "Enable alacritty.";
  };

  config = lib.mkIf config.h.alacritty.enable {
    home-manager.users.${config.h.username} = {
      programs.alacritty = {
        enable = true;
        settings = {
          env = {
            "TERM" = "xterm-256color";
          };
          shell = {
            program = "${pkgs.fish}/bin/fish";
          };
          font = {
            normal = {
              #family = "NotoSansM Nerd Font";
              family = "CaskaydiaCove NF";
              style = "Regular";
            };
            bold = {
              #family = "NotoSansM Nerd Font";
              family = "CaskaydiaCove NF";
              style = "Bold";
            };
            italic = {
              #family = "NotoSansM Nerd Font";
              family = "CaskaydiaCove NF";
              style = "Italic";
            };
            size = 29;
          };
          window = {
            dynamic_padding = true;
            dynamic_title = true;
            opacity = 0.89;
            decorations = "buttonless";
            padding = {
              x = 5;
              y = 5;
            };
          };
          colors = {
            primary = {
              background = "0x000000";
              foreground = "0xebdbb2";
            };
            normal = {
              black = "0x282828";
              red = "0xcc241d";
              green = "0x98971a";
              yellow = "0xd79921";
              blue = "0x458588";
              magenta = "0xb16286";
              cyan = "0x689d6a";
              white = "0xa89984";
            };
            bright = {
              black = "0x928374";
              red = "0xfb4934";
              green = "0xb8bb26";
              yellow = "0xfabd2f";
              blue = "0x83a598";
              magenta = "0xd3869b";
              cyan = "0x8ec07c";
              white = "0xebdbb2";
            };
          };
        };
      };
    };
  };
}
